import 'package:flutter/material.dart';
import 'package:quantri_app/pages/login/login_page.dart';
import 'package:quantri_app/constant/router_name.dart';
import 'package:quantri_app/pages/main_page/dashboard/dashboard_main_page.dart';
import 'package:quantri_app/pages/main_page/dashboard/tenant/tenant_category_detail_page.dart';
import 'package:quantri_app/pages/main_page/dashboard/tenant/tenant_detail_page.dart';
import 'package:quantri_app/pages/main_page/profile/profile_edit_page.dart';
import 'package:quantri_app/pages/main_page/profile/profile_page.dart';
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
    case TENANT_CATEGORY_DETAIL_ROUTE:
      return MaterialPageRoute(builder: (context) => TenantCategoryDetailPage(categoryName: settings.arguments as String,));
    case TENANT_DETAIL_ROUTE:
      return MaterialPageRoute(builder: (context) => TenantDetailPage(tenantID: settings.arguments,));
    case PROFILE_ROUTE:
      return MaterialPageRoute(builder: (context) => ProfilePage());
    case PROFILE_EDIT_ROUTE:
      return MaterialPageRoute(builder: (context) => ProfileEditPage());
    default:
      return MaterialPageRoute(builder: (context) => LoginPage());
  }
}