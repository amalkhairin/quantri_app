import 'package:flutter/material.dart';
import 'package:quantri_app/constant/color.dart';
import 'package:quantri_app/pages/main_page/dashboard/dashboard_main_page.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({ Key? key }) : super(key: key);

  @override
  _AppNavigationState createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  // initial page index
  int _selectedPage = 0;

  // list pages
  List<Widget> _pages = [
    DashboardPage(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {

    // body
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedPage],
      // bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        backgroundColor: Colors.white,
        currentIndex: _selectedPage,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey[400],
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 24,),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_rounded, size: 36, color: Colors.red,),
            label: "Add"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded, size: 24,),
            label: "Profile"
          ),
        ],
      ),
    );
  }
}