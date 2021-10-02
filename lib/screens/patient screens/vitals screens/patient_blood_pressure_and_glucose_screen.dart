import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_vitals/providers/bluetooth_provider.dart';
import 'package:smart_vitals/widgets/patient%20widgets/circular_button_widget.dart';

class BloodPressureAndGlucoseScreen extends StatelessWidget {
  const BloodPressureAndGlucoseScreen({Key? key}) : super(key: key);
  static const screenName = 'BloodPressureAndGlucoseScreen';
  @override
  Widget build(BuildContext context) {
    print('blood pressure and glucose screen built');
    //BluetoothProvider _bluetoothProvider =Provider.of<BluetoothProvider>(context,listen: false);
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
            Row(
              children: [
               Text('yor Blood Pressure is: ',style: TextStyle(color: Colors.black,fontSize: 10),),
                Consumer<BluetoothProvider>(builder: (context,provider,_){
                  return provider.latestMeasurement.toString().isEmpty? Text('No Data fetched') : Text(provider.latestMeasurement.toString());
                })
              ],
            )

          ],
        ));
  }
}
