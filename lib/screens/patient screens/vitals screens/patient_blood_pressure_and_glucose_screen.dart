import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_vitals/providers/bluetooth_provider.dart';
import 'package:smart_vitals/widgets/patient%20widgets/circular_button_widget.dart';
import 'package:smart_vitals/widgets/patient%20widgets/titled_space_widget.dart';

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
        body: Container(
          color: Colors.blue[50],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: deviceSize.height * 0.05,
              ),
              Center(
                child: Container(
                  child: Consumer<BluetoothProvider>(
                    builder: (context, provider, _) {
                      return CircularButton(() {
                        provider.sendData('0');
                      });
                    },
                  ),
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
                        titleText: 'Glucose measurement:',
                        widgets: [
                          /*  provider.gp.length < 1
                                ? Text('No Data fetched'): 
                                Text(provider.gp[0].toString()),
                            SizedBox(
                              height: 5,
                            ),
                            provider.gp.length < 2
                                ? Text('No Data fetched')
                                : Text(provider.gp[1].toString()),
                            SizedBox(
                              height: 5,
                            ),*/
                          provider.gp.length < 3
                              ? Text('\n No measurements yet')
                              : Text(provider.gp[2].toString()),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      titledSpaceWidget(
                        fontSize: deviceSize.height * 0.03,
                        titleText: 'Blod pressure measurement:',
                        widgets: [
                          provider.gp.length < 4
                              ? Text('\n No measurements yet')
                              : Text(provider.gp[3].toString()),
                          SizedBox(
                            height: 5,
                          ),
                          provider.gp.length < 5
                              ? Text('\n No measurements yet')
                              : Text(
                                  provider.gp[4].toString(),
                                ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              })
            ],
          ),
        ));
  }
}


 
 
 
 
 
 
/* 
 Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8, top: 20),
                              child: Text(
                                'Glucose measurement:',
                                style: TextStyle(
                                  fontSize: deviceSize.height * 0.03,
                                  color: Colors.blue[900],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10, left: 20),
                              child: Column(
                                children: [
                                  /*  provider.gp.length < 1
                                ? Text('No Data fetched'): 
                                Text(provider.gp[0].toString()),
                            SizedBox(
                              height: 5,
                            ),
                            provider.gp.length < 2
                                ? Text('No Data fetched')
                                : Text(provider.gp[1].toString()),
                            SizedBox(
                              height: 5,
                            ),*/
                                  provider.gp.length < 3
                                      ? Text('\n No measurements yet')
                                      : Text(provider.gp[2].toString()),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8, top: 20),
                              child: Text(
                                'Blod pressure measurement:',
                                style: TextStyle(
                                  fontSize: deviceSize.height * 0.03,
                                  color: Colors.blue[900],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: [
                                  provider.gp.length < 4
                                      ? Text('\n No measurements yet')
                                      : Text(provider.gp[3].toString()),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  provider.gp.length < 5
                                      ? Text('\n No measurements yet')
                                      : Text(
                                          provider.gp[4].toString(),
                                        ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )*/