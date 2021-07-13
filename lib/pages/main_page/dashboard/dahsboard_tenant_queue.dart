import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:quantri_app/component/button/qa_button1.dart';
import 'package:quantri_app/constant/color.dart';

class DashboardTenantQueue extends StatelessWidget {
  const DashboardTenantQueue({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            SizedBox(height: 42,),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("No. Antrian", style: TextStyle(fontSize: 18),),
                            FittedBox(child: Text("05", style: TextStyle(fontSize: 54, color: primaryColor),)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Jam Layanan", style: TextStyle(fontSize: 18),),
                            Text("10.30", style: TextStyle(fontSize: 24, color: primaryColor),),
                          ],
                        ),
                      ],
                    ),
                  ),
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
            QAButton1(
              onPressed: (){},
              label: Text("Re-Schedule"),
              style: QAButtonStyle.SECONDARY,
            ),
            SizedBox(height: 14,),
            QAButton1(
              onPressed: (){},
              label: Text("Cancel"),
              style: QAButtonStyle.SECONDARY,
            ),
          ],
        ),
      ),
    );
  }
}