import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:quantri_app/component/button/qa_button1.dart';
import 'package:quantri_app/component/dialog/qa_dialog.dart';
import 'package:quantri_app/component/input_form/qa_dropdown_input_field.dart';
import 'package:quantri_app/constant/color.dart';
import 'package:quantri_app/constant/router_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardTenantQueue extends StatefulWidget {
  const DashboardTenantQueue({ Key? key }) : super(key: key);

  @override
  State<DashboardTenantQueue> createState() => _DashboardTenantQueueState();
}

class _DashboardTenantQueueState extends State<DashboardTenantQueue> {

  bool _isHasData = false;
  List<String> _operationalTime = ["09.00", "10.00", "11.00", "12.00"];
  String? _selectedTime;
  Position? _myPosition;

  Future<void> _getMyPosition() async {
    Position pos = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    print(pos);
    setState(() {
      _myPosition = pos;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getMyPosition();
  }

  @override
  Widget build(BuildContext context) {
    // get app screen size
    Size screenSize = MediaQuery.of(context).size;
    
    // body
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // tenant name
            Text("Tenan", style: TextStyle(fontSize: 18),),
            SizedBox(height: 14,),
            TextFormField(
              readOnly: true,
              initialValue: "Pemkot Bandung",
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderSide: BorderSide(), borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(), borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 14,),

            //distance
            _myPosition == null
            ? Text("... Km")
            : Container(
              height: 48,
              width: screenSize.width,
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.red, size: 16,),
                  Text("${(Geolocator.distanceBetween(_myPosition!.latitude, _myPosition!.longitude, -7.025253, 107.519760)/10000).toStringAsFixed(2)} Km"),
                  SizedBox(width: 4,),
                  Text(">"),
                  SizedBox(width: 8,),
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      RotateAnimatedText("10 Menit dengan Motor", duration: Duration(milliseconds: 3000)),
                      RotateAnimatedText("23 Menit dengan Berjalan Kaki", duration: Duration(milliseconds: 3000)),
                      RotateAnimatedText("15 Menit dengan Mobil", duration: Duration(milliseconds: 3000)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 42,),

            // queue detail
            Container(
              height: 175,
              width: screenSize.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        // queue number
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("No. Antrian", style: TextStyle(fontSize: 18),),
                            FittedBox(child: Text("15", style: TextStyle(fontSize: 54, color: primaryColor),)),
                          ],
                        ),

                        // services time
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Jam Layanan", style: TextStyle(fontSize: 18),),
                            Text(_selectedTime??"9.00", style: TextStyle(fontSize: 24, color: primaryColor),),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // QR Code
                  Container(
                    child: QrImage(
                      data: "test",
                      version: QrVersions.auto,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 42,),

            // reschedule button
            QAButton1(
              onPressed: (){
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )
                  ),
                  context: context, 
                  builder: (sheetContext){
                    return StatefulBuilder(
                      builder: (sheetContext, StateSetter setter) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(24, 42, 24, 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Pemkot Bandung", style: TextStyle(fontSize: 24),),
                              SizedBox(height: 24,),
                              Text("Jam Layanan"),
                              SizedBox(height: 8,),
                              QADropdownInputField(
                                value: _selectedTime,
                                items: _operationalTime,
                                hintText: "Pilih jam layanan",
                                onChanged: (String? value) {
                                  setter(() {
                                    _selectedTime = value!;
                                  });

                                  setState(() {
                                    _selectedTime = value;
                                  });
                                },
                              ),
                              SizedBox(height: 42,),
                              QAButton1(
                                onPressed: () async {
                                  Navigator.of(sheetContext).pop();
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setBool("has_queued", true);
                                  // Navigator.of(context).pushNamed(DASHBOARD_ROUTE);
                                },
                                label: Text("Re-Schedule Antrian"),
                              )
                            ],
                          ),
                        );
                      }
                    );
                  }
                );
              },
              label: Text("Re-Schedule"),
              style: QAButtonStyle.SECONDARY,
            ),
            SizedBox(height: 14,),

            // cancel button
            QAButton1(
              onPressed: () {
                showDialog(
                  context: this.context,
                  builder: (context) => QADialog(
                    title: "Batalkan Antrian", 
                    description: "Apakah anda yakin ingin membatalkan antrian saat ini?",
                    action: [
                      QAButton1(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        label: Text("Tidak"),
                        style: QAButtonStyle.SECONDARY,
                      ),
                      QAButton1(
                        onPressed: () async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setBool("has_queued", false);
                          Navigator.of(context).pop();
                          Navigator.of(context).pushReplacementNamed(DASHBOARD_ROUTE);
                        },
                        label: Text("Ya"),
                      ),
                    ],
                  )
                );
              },
              label: Text("Cancel"),
              style: QAButtonStyle.SECONDARY,
            ),
          ],
        ),
      ),
    );
  }
}