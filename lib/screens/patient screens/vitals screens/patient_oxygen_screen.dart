import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_vitals/providers/bluetooth_provider.dart';
import 'package:smart_vitals/widgets/patient%20widgets/circular_button_widget.dart';

class OxygenScreen extends StatelessWidget {
  const OxygenScreen({Key? key}) : super(key: key);
  static const screenName = 'Oxygen';
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: deviceSize.height * 0.05,
            ),
            Center(
              child: Consumer<BluetoothProvider>(
                builder: (context, provider, _) {
                  
                  return CircularButton((){provider.sendData('0');});
                },
              ),
            ),
          ],
        ));
  }
}
