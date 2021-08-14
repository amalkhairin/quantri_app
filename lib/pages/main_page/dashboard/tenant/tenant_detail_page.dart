import 'package:flutter/material.dart';
import 'package:quantri_app/component/button/qa_button1.dart';
import 'package:quantri_app/component/dialog/qa_dialog.dart';
import 'package:quantri_app/component/input_form/qa_dropdown_input_field.dart';
import 'package:quantri_app/constant/color.dart';
import 'package:quantri_app/constant/router_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TenantDetailPage extends StatefulWidget {
  final tenantID;
  const TenantDetailPage({ Key? key, this.tenantID }) : super(key: key);

  @override
  _TenantDetailPageState createState() => _TenantDetailPageState();
}

class _TenantDetailPageState extends State<TenantDetailPage> {

  List _tenantServices = ["Umum", "Manufacturing"];

  List<String> _operationalTime = ["09.00","10.00","11.00","12.00"];
  String? _selectedTime;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: Stack(
          children: [

            // image container
            Stack(
              children: [
                Container(
                  color: primaryColor,
                  width: screenSize.width,
                  height: screenSize.height * 0.4,
                  child: Image.network("https://www.theagilityeffect.com/app/uploads/2019/03/00_VINCI-ICONOGRAPHIE-GettyImages-890132412_1280x680.jpg", fit: BoxFit.cover,),
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.black.withOpacity(0)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                    )
                  ),
                ),
              ],
            ),

            // app bar
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    Text("Kembali", style: TextStyle(fontSize: 24, color: Colors.white,))
                  ],
                ),
              ),
            ),

            // detail container
            Positioned(
              top: screenSize.height - screenSize.height / 1.5,
              bottom: MediaQuery.of(context).viewInsets.bottom,
              child: Container(
                height: screenSize.height/1.45,
                width: screenSize.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),)
                ),
                child: Stack(
                  children: [

                    // tenant detail
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Dinas Catatan Sipil dan Kependudukan\nPemkot Bandung", style: TextStyle(fontSize: 24),),
                            SizedBox(height: 14,),
                            Text("Jl. Sangkuriang No.10A, Dago, Kecamatan Coblong, Kota Bandung, Jawa Barat"),
                            SizedBox(height: 24,),
                            Text("Layanan", style: TextStyle(fontSize: 18,),),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: _tenantServices.length,
                              itemBuilder: (context, index){
                                return InkWell(
                                  onTap: (){
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
                                                  Text("Layanan ${_tenantServices[index]}", style: TextStyle(fontSize: 24),),
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
                                                    },
                                                  ),
                                                  SizedBox(height: 42,),
                                                  QAButton1(
                                                    onPressed: () async {
                                                      Navigator.of(sheetContext).pop();
                                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                                      prefs.setBool("has_queued", true);
                                                      Navigator.of(context).pushNamed(DASHBOARD_ROUTE);
                                                    },
                                                    label: Text("Ambil Antrian"),
                                                  )
                                                ],
                                              ),
                                            );
                                          }
                                        );
                                      }
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Flexible(
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: itemBackgroundColor,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          padding: EdgeInsets.all(8),
                                          child: Icon(Icons.home_filled, color: Colors.blue, size: 42,),
                                        ),
                                      ),
                                      SizedBox(height: 8,),
                                      Text(_tenantServices[index]),
                                    ],
                                  ),
                                );
                              },
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 3 / 4,
                                crossAxisSpacing: 14,
                                mainAxisSpacing: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    // add inner glow to list top and bottom edge
                    Positioned(
                      top: 0,
                      child: Container(
                        height: 26,
                        width: screenSize.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.white, Colors.white.withOpacity(0.3) ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter
                          ),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),)
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 42,
                        width: screenSize.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.white, Colors.white.withOpacity(0.3) ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}