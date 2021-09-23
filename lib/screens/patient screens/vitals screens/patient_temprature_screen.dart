import 'package:flutter/material.dart';

class TempratureScreen extends StatelessWidget {
  const TempratureScreen({Key? key}) : super(key: key);
  static const screenName = 'Temorature';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Temprature',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
