import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:quantri_app/component/button/qa_button1.dart';
import 'package:quantri_app/constant/color.dart';
import 'package:quantri_app/pages/main_page/dashboard/dahsboard_tenant_queue.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({ Key? key }) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          child: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    color: primaryColor,
                    width: screenSize.width,
                    height: screenSize.height * 0.5,
                    child: Image.asset("assets/img/pattern.png", fit: BoxFit.cover,),
                  ),
                  Container(
                    width: screenSize.width,
                    height: screenSize.height * 0.5,
                    padding: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          child: Image.asset("assets/img/icon.png"),
                        ),
                        SizedBox(height: 14,),
                        Text("Amal Khairin", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white,)),
                        SizedBox(height: 8,),
                        Text("085xxxxxxx", style: TextStyle(fontSize: 18, color: Colors.white),)
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: screenSize.height/1.45,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),)
                  ),
                  child: Stack(
                    children: [
                      DashboardTenantQueue(),
                      Positioned(
                        top: 0,
                        child: Container(
                          height: 42,
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
      )
    );
  }
}