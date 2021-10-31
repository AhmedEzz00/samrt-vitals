import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_vitals/dumy%20data/glucose_history_dummy_data.dart';
import 'package:smart_vitals/dumy%20data/heart_rate_history_dummy_data.dart';
import 'package:smart_vitals/dumy%20data/pressure_histort_dummy_data.dart';
import 'package:smart_vitals/dumy%20data/spo2_history_dummy_Data.dart';
import 'package:smart_vitals/dumy%20data/temprature_history_dummy_data.dart';
import 'package:smart_vitals/themes.dart';
import 'package:smart_vitals/widgets/patient%20widgets/measurements_history_item.dart';

class MeasurementHistoryScreen extends StatelessWidget {
  static const String screenName = 'PatientMeasurementsHistory';

  @override
  Widget build(BuildContext context) {
    final _kTabs = <Tab>[
      const Tab(
        child: Text(
          'Pressure ',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      const Tab(
        child: Text(
          ' Heart rate',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      const Tab(
        child: Text(
          ' Temperature',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      const Tab(
        child: Text(
          ' Glucose',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      const Tab(
        child: Text(
          ' SPO2',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    ];
    return DefaultTabController(
      initialIndex: 2,
      length: _kTabs.length,
      child: Scaffold(
        backgroundColor: MyThemes.lightTheme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: MyThemes.primaryColor,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Icon(
                FontAwesomeIcons.history,
                color: Colors.grey[300],
              ),
            )
          ],
          title: Text(
            ' Measurement History',
          ),
          bottom: TabBar(
            isScrollable: true,
            tabs: _kTabs,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  // first tab bar view widget

                  Container(
                    child: Center(
                      child: Text(
                        'Pressure',
                        style: MyThemes.lightTheme.textTheme.bodyText1,
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        'Heart rate',
                        style: MyThemes.lightTheme.textTheme.bodyText1,
                      ),
                    ),
                  ),
                  Container(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return patientMeasurementsHistoryItem(
                            icon: tempratureHistoryData[index].icon,
                            measurement: [
                              Text(tempratureHistoryData[index].temprature)
                            ],
                            history: [
                              Text(
                                tempratureHistoryData[index].date,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(tempratureHistoryData[index].time)
                            ]);
                      },
                      itemCount: tempratureHistoryData.length,
                    ),
                  ),
                  Container(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return patientMeasurementsHistoryItem(
                            icon: glucoseHistoryData[index].icon,
                            measurement: [
                              Text(glucoseHistoryData[index].glucose)
                            ],
                            history: [
                              Text(
                                glucoseHistoryData[index].date,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(glucoseHistoryData[index].time)
                            ]);
                      },
                      itemCount: glucoseHistoryData.length,
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        ' Spo2',
                        style: MyThemes.lightTheme.textTheme.bodyText1,
                      ),
                    ),
                  ),
                  // second tab bar viiew widget
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<GlucoseHistory> glucoseHistoryData = [
  GlucoseHistory(
    icon: 'assets/images/glucometerr.svg',
    date: '22/10/2021',
    glucose: 'Glucose: 124',
    time: '10:45 PM',
  ),
  GlucoseHistory(
    icon: 'assets/images/glucometerr.svg',
    date: '26/10/2021',
    glucose: 'Glucose: 105',
    time: '09:15 PM',
  ),
  GlucoseHistory(
    icon: 'assets/images/glucometerr.svg',
    date: '31/10/2021',
    glucose: 'Glucose: 101',
    time: '07:00 AM',
  ),
  GlucoseHistory(
    icon: 'assets/images/glucometerr.svg',
    date: '5/11/2021',
    glucose: 'Glucose: 109',
    time: '05:11 PM',
  ),
  GlucoseHistory(
    icon: 'assets/images/glucometerr.svg',
    date: '22/10/2021',
    glucose: 'Glucose: 124',
    time: '10:45 AM',
  ),
  GlucoseHistory(
    icon: 'assets/images/glucometerr.svg',
    date: '22/10/2021',
    glucose: 'Glucose: 124',
    time: '10:45 AM',
  ),
];

List<TempratureHistory> tempratureHistoryData = [
  TempratureHistory(
      icon: 'assets/images/dummy_thermometer.svg',
      temprature: '39.0c',
      date: '22/10/2021',
      time: '10:00 PM'),
  TempratureHistory(
      icon: 'assets/images/dummy_thermometer.svg',
      temprature: '36.7c',
      date: '21/10/2021',
      time: '05:35 PM'),
  TempratureHistory(
      icon: 'assets/images/dummy_thermometer.svg',
      temprature: '37.0c',
      date: '20/10/2021',
      time: '09:20 AM'),
  TempratureHistory(
      icon: 'assets/images/dummy_thermometer.svg',
      temprature: '38.1c',
      date: '18/10/2021',
      time: '12:00 AM'),
  TempratureHistory(
      icon: 'assets/images/dummy_thermometer.svg',
      temprature: '37.8c',
      date: '17/10/2021',
      time: '03:25 PM'),
  TempratureHistory(
      icon: 'assets/images/dummy_thermometer.svg',
      temprature: '37.5c',
      date: '15/10/2021',
      time: '06:16 PM'),
];

List<HeartRateHistory>? heartRateHistoryData = [
  HeartRateHistory(
    date: '',
    heartRate: '',
    time: '',
  ),
];

List<Spo2History> spo2HistoryData = [];
List<PressureHistory> pressureHistoryData = [];


//icon: 'assets/images/oxygen-tank.svg',