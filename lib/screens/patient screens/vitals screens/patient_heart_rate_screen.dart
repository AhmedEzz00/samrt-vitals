import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/bluetooth_provider.dart';
import '../../../widgets/patient%20widgets/circular_button_widget.dart';
import '../../../widgets/patient%20widgets/titled_space_widget.dart';

class HeartRateScreen extends StatelessWidget {
  const HeartRateScreen({Key? key}) : super(key: key);
  static const screenName = 'HeartRate';

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Heart rate',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        color: Colors.blue[50],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: deviceSize.height * 0.05,
            ),
            Center(
              child: Consumer<BluetoothProvider>(
                builder: (context, provider, _) {
                  return CircularButton(() {
                    provider.sendData('2');
                  });
                },
              ),
            ),
            Consumer<BluetoothProvider>(builder: (context, provider, _) {
              return Padding(
                  padding: const EdgeInsets.only(top: 15, right: 12, left: 12),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        titledSpaceWidget(
                            fontSize: deviceSize.height * 0.03,
                            titleText: 'Heart rate measurements:',
                            widgets: [
                              SizedBox(
                                height: 5,
                              ),
                              provider.heartRate == null
                                  ? Text('\n No measurements yet')
                                  : Text(
                                      provider.heartRate.toString(),
                                      maxLines: 2,
                                    ),
                              SizedBox(
                                height: 20,
                              )
                            ])
                      ]));
            })
          ],
        ),
      ),
    );
  }
}


/*
                  SizedBox(
                    height: 5,
                  ),
                  provider.heartRate == null
                      ? Text('No Data fetched')
                      : Text(
                          provider.heartRate.toString(),
                          maxLines: 2,
                        ),
                
*/