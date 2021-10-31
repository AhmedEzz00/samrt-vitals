import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_vitals/screens/doctor%20screens/settings_screen.dart';

import 'doctor_home_ screen.dart';
import 'doctor_profie_screen.dart';

class DoctorMainScreen extends StatefulWidget {
  static const screenName = 'DoctorMainScreen';

  @override
  _DoctortMainScreenState createState() => _DoctortMainScreenState();
}

class _DoctortMainScreenState extends State<DoctorMainScreen> {
  int _selectedIndex = 1;

  static List<Widget> _screens = [
    DoctorProfileScreen(),
    DoctorHomeScreen(),
    DoctorSettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.white,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          unselectedLabelStyle: TextStyle(color: Colors.grey[100]),
          selectedLabelStyle: TextStyle(color: Colors.white),
          //fixedColor: Colors.white,
          backgroundColor: Colors.blue[800],
          items: [
            BottomNavigationBarItem(
              label: 'profile',
              icon: SvgPicture.asset('assets/images/Group.svg',
                  height: deviceSize.height * 0.04),
            ),
            BottomNavigationBarItem(
              label: 'home',
              icon: Container(
                child: SvgPicture.asset(
                  'assets/images/home.svg',
                  height: deviceSize.height * 0.04,
                  color: Colors.grey[300],
                ),
              ),
            ),
             BottomNavigationBarItem(
              label: 'settings',
              icon: SvgPicture.asset('assets/images/settings.svg',
                  color: Colors.grey[100], height: deviceSize.height * 0.04),
            ), 
          ],
        ),
        body: Center(
          child: _screens[_selectedIndex],
        ),
      ),
    );
  }
}
