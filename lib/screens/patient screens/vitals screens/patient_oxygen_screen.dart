import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_vitals/providers/bluetooth_provider.dart';
import 'package:smart_vitals/widgets/patient%20widgets/circular_button_widget.dart';
import 'package:smart_vitals/widgets/patient%20widgets/titled_space_widget.dart';

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
                    provider.sendData('3');
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
                        titleText: 'Oxygen measurement:',
                        widgets: [
                          SizedBox(
                            height: 5,
                          ),
                          provider.oxygen == null
                              ? Text('\n No measurements yet')
                              : Text(
                                  provider.oxygen.toString(),
                                  maxLines: 2,
                                ),
                                SizedBox(height: 20,)
                        ])
                  ],
                ),
              );
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
                provider.oxygen == null
                    ? Text('No Data fetched')
                    : Text(
                        provider.oxygen.toString(),
                        maxLines: 2,
                      ),*/