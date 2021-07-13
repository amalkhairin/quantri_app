import 'package:flutter/material.dart';
import 'package:quantri_app/config/app_router.dart';
import 'package:quantri_app/constant/router_name.dart';
import 'package:quantri_app/pages/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qu-Antri',
      debugShowCheckedModeBanner: false,  //disable debug flag banner
      onGenerateRoute: generateRoute,     //generate route
      initialRoute: APP_NAVIGATION_ROUTE, //set initial app route
    );
  }
}