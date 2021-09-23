import 'package:flutter/material.dart';
import 'package:smart_vitals/widgets/patient%20widgets/circular_button_widget.dart';

class BloodPressureAndGlucoseScreen extends StatelessWidget {
  const BloodPressureAndGlucoseScreen({Key? key}) : super(key: key);
  static const screenName = 'BloodPressureScreen';
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(
            'Blood Pressure & Glucose',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: deviceSize.height*0.05,),
            Center(child: circularButton(deviceSize)),
          ],
        ));
  }
}
