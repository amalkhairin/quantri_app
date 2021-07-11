import 'package:flutter/material.dart';
import 'package:quantri_app/pages/dashboard/dashboard_page.dart';
import 'package:quantri_app/pages/login/login_page.dart';
import 'package:quantri_app/constant/router_name.dart';
import 'package:quantri_app/pages/register/register_step_one_page.dart';
import 'package:quantri_app/pages/register/register_step_two_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LOGIN_ROUTE:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case REGISTER_ONE_ROUTE:
      return MaterialPageRoute(builder: (context) => RegisterPage());
    case REGISTER_TWO_ROUTE:
      return MaterialPageRoute(builder: (context) => RegisterStepTwoPage(data: settings.arguments,));
    case DASHBOARD_ROUTE:
      return MaterialPageRoute(builder: (context) => DashboardPage());
    default:
      return MaterialPageRoute(builder: (context) => LoginPage());
  }
}