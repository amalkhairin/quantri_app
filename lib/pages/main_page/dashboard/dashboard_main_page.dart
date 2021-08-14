import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:quantri_app/component/button/qa_button1.dart';
import 'package:quantri_app/component/dialog/qa_dialog.dart';
import 'package:quantri_app/constant/color.dart';
import 'package:quantri_app/constant/router_name.dart';
import 'package:quantri_app/pages/main_page/dashboard/tenant/dahsboard_tenant_queue.dart';
import 'package:quantri_app/pages/main_page/dashboard/tenant/dashboard_tenant_category.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({ Key? key }) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  bool _isHasData = false;

  Future<void> loadQueueData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('has_queued')) {
      setState(() {
        _isHasData = prefs.getBool("has_queued")?? false;
      });
    }
  }

  Future<bool> onBackPressed() async {
    return await showDialog(
      context: this.context,
      builder: (context) => QADialog(
        title: "Keluar", 
        description: "Keluar dari aplikasi?",
        action: [
          QAButton1(
            onPressed: (){
              Navigator.of(context).pop(false);
            },
            label: Text("Tidak"),
            style: QAButtonStyle.SECONDARY,
          ),
          QAButton1(
            onPressed: (){
              Navigator.of(context).pop(true);
            },
            label: Text("Ya"),
          ),
        ],
      )
    )??false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadQueueData();
  }

  @override
  Widget build(BuildContext context) {
    // get app screen size
    Size screenSize = MediaQuery.of(context).size;
    // body
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: primaryColor,
      body: WillPopScope(
        onWillPop: onBackPressed,
        child: SafeArea(
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            child: Stack(
              children: [
      
                // background container
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
                      height: screenSize.height * 0.3,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Amal Khairin", maxLines: 1, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white,)),
                                  SizedBox(height: 8,),
                                  Text("085xxxxxxx", style: TextStyle(fontSize: 18, color: Colors.white),)
                                ],
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).pushNamed(PROFILE_ROUTE);
                                },
                                child: CircleAvatar(
                                  radius: 24,
                                  foregroundColor: Colors.red,
                                  backgroundColor: Colors.white,
                                  child: Text('A'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
      
                // dashboard container
                Positioned(
                  top: screenSize.height - screenSize.height / 1.25,
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
      
                        _isHasData? DashboardTenantQueue() : DashboardTenantCategory(),
      
                        // add inner glow to list top and bottom edge
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
        ),
      )
    );
  }
}