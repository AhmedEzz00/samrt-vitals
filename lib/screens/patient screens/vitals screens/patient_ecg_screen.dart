import 'package:flutter/material.dart';

class EcgScreen extends StatelessWidget {
  const EcgScreen({Key? key}) : super(key: key);
  static const screenName = 'ECG';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'ECG',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
