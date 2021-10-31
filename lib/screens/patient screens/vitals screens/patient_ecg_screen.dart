import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/bluetooth_provider.dart';
import '../../../widgets/patient%20widgets/circular_button_widget.dart';

// ignore: must_be_immutable
class EcgScreen extends StatelessWidget {
  static const screenName = 'ECG';
  // List<TestData>? _testData;
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(
            'ECG',
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
                    provider.sendData('4');
                  });
                },
              ),
            ),
            /*Consumer<BluetoothProvider>(builder: (context, provider, _) {
              if(provider.ecg.last=!null){
                _testData.add();
              }
              return Container(
                height: deviceSize.height / 3,
                child: SfCartesianChart(
                  enableAxisAnimation: true,
                  series: <LineSeries<TestData, double>>[
                    LineSeries<TestData, double>(
                        dataSource: _testData,
                        xValueMapper: (TestData data, _) => data.x,
                        yValueMapper: (TestData data, _) => data.y),
                  ],
                  primaryXAxis: NumericAxis(
                    minimum: 0,
                    maximum: 20,
                    isVisible: true,
                    decimalPlaces: 7,
                  ),
                  primaryYAxis: NumericAxis(
                    minimum: 0,
                    maximum: 1000,
                    isVisible: true,
                    decimalPlaces: 5,
                  ),
                ),
              );
            }),*/
          ],
        ));
  }
}

class TestData {
  final double x;
  final double y;
  TestData(this.x, this.y);
}
