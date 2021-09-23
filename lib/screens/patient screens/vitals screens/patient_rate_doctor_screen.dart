import 'package:flutter/material.dart';

class RateDoctorScreen extends StatelessWidget {
  const RateDoctorScreen({Key? key}) : super(key: key);
  static const screenName = 'RateDoctor';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Rate the doctor',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
