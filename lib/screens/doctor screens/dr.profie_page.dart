import 'package:flutter/material.dart';

class DrProfile extends StatefulWidget {
  @override
  _DrProfileState createState() => _DrProfileState();
}

class _DrProfileState extends State<DrProfile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dr Profile',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 5,
          ),
        ],
      ),
    );
  }
}
