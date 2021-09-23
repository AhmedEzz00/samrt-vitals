import 'package:flutter/material.dart';

class GlucoseScreen extends StatelessWidget {
  const GlucoseScreen({Key? key}) : super(key: key);
  static const screenName = 'Glocuse';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Glocuse',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
