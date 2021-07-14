import 'package:flutter/material.dart';
import 'package:quantri_app/pages/login/login_page.dart';
import 'package:quantri_app/constant/router_name.dart';
import 'package:quantri_app/pages/main_page/app_navigation.dart';
import 'package:quantri_app/pages/main_page/dashboard/dashboard_main_page.dart';
import 'package:quantri_app/pages/main_page/dashboard/tenant/tenant_category_detail_page.dart';
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
    case APP_NAVIGATION_ROUTE:
      return MaterialPageRoute(builder: (context) => AppNavigation());
    case TENANT_CATEGORY_DETAIL_ROUTE:
      return MaterialPageRoute(builder: (context) => TenantCategoryDetailPage(categoryName: settings.arguments,));
    default:
      return MaterialPageRoute(builder: (context) => LoginPage());
  }
}