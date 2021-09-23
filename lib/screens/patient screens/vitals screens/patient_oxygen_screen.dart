import 'package:flutter/material.dart';

class OxygenScreen extends StatelessWidget {
  const OxygenScreen({Key? key}) : super(key: key);
  static const screenName = 'Oxygen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Oxygen',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
