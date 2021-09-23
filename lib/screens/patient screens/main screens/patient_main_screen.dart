import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'patient_home_screen.dart';
import 'patient_profile_screen.dart';
import 'settings_screen.dart';

class PatientMainScreen extends StatefulWidget {
  const PatientMainScreen({Key? key}) : super(key: key);

  @override
  _PatientMainScreenState createState() => _PatientMainScreenState();
}

class _PatientMainScreenState extends State<PatientMainScreen> {
  int _selectedIndex = 1;
  void _onItemTaooed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _screens = [
    patientProfile(),
    PatientHomeScreen(),
    SettingsScreen()
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
          onTap: _onItemTaooed,
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
          child: _screens.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
