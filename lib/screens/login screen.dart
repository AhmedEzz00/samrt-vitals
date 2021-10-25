import 'package:flutter/material.dart';
import 'package:smart_vitals/screens/patient%20screens/main%20screens/patient_main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
            color: Colors.blue,
            child: Text(
              'Patient',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(PatientMainScreen.screenName);
            },
          ),
          MaterialButton(
            color: Colors.blue,
            child: Text(
              'Doctor',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          )
        ],
      )),
    );
  }
}
