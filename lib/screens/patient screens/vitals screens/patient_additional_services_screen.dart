import 'package:flutter/material.dart';

class AdditionalServicesScreen extends StatelessWidget {
  const AdditionalServicesScreen({Key? key}) : super(key: key);
  static const screenName = 'AdditionalServices';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar( 
        backgroundColor: Colors.blue[900],
        title: Text(
          'Additional services',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ) ,
    );
  }
}
