import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/bluetooth_provider.dart';
import '../../../widgets/patient%20widgets/circular_button_widget.dart';

class TempratureScreen extends StatelessWidget {
  const TempratureScreen({Key? key}) : super(key: key);
  static const screenName = 'Temorature';

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: deviceSize.height * 0.05,
            ),
            Center(
              child: Consumer<BluetoothProvider>(
                builder: (context, provider, _) {
                  return CircularButton(() {
                    provider.sendData('1');
                  });
                },
              ),
            ),
            Consumer<BluetoothProvider>(builder: (context, provider, _) {
              return Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  provider.temprature == null
                      ? Text('No Data fetched')
                      : Text(
                          provider.temprature.toString(),
                          maxLines: 2,
                        ),
                ],
              );
            })
          ],
        ));
  }
}
