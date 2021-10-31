import 'package:flutter/material.dart';
import 'package:smart_vitals/constants.dart';
import 'package:smart_vitals/models/patient%20models/vitals_models.dart';
import 'package:smart_vitals/screens/patient%20screens/vitals%20screens/patient_measurements_history_screen.dart';
import 'package:smart_vitals/screens/patient%20screens/vitals%20screens/patient_blood_pressure_and_glucose_screen.dart';
import 'package:smart_vitals/screens/patient%20screens/vitals%20screens/patient_ecg_screen.dart';
import 'package:smart_vitals/screens/patient%20screens/vitals%20screens/patient_heart_rate_screen.dart';
import 'package:smart_vitals/screens/patient%20screens/vitals%20screens/patient_oxygen_screen.dart';
import 'package:smart_vitals/screens/patient%20screens/vitals%20screens/patient_rate_doctor_screen.dart';
import 'package:smart_vitals/screens/patient%20screens/vitals%20screens/patient_Connection_screen.dart';
import 'package:smart_vitals/screens/patient%20screens/vitals%20screens/patient_temprature_screen.dart';

import '../../../widgets/patient%20widgets/grid_view_item_widget.dart';

class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: deviceSize.height * 0.3,
              decoration: BoxDecoration(
                gradient: gradientColors,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100.0),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: deviceSize.height * 0.1,
                  ),
                  Text(
                    'Welcome back, Ahmed',
                    style: TextStyle(
                        fontSize: deviceSize.height * 0.04,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.02,
                  ),
                  Text(
                    'How may I help?',
                    style: TextStyle(
                      fontSize: deviceSize.height * 0.03,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: deviceSize.height * 0.05,
            ),
            Expanded(
              child: Container(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 7,
                  ),
                  itemBuilder: (context, index) {
                    return gridViewItem(
                        context,
                        vitalsModels.elementAt(index).icon,
                        vitalsModels.elementAt(index).text,
                        vitalsModels.elementAt(index).screenName);
                  },
                  itemCount: vitalsModels.length,
                ),
              ),
            ),
            SizedBox(
              height: deviceSize.height * 0.005,
            )
          ],
        ),

        //stack contd.
        Column(
          children: [
            SizedBox(
              height: deviceSize.height * 0.29,
            ),
            Center(
              child: Container(
                width: deviceSize.width * 0.9,
                height: deviceSize.height * 0.05,
                child: FittedBox(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'What vitals do you want to measure?',
                      style: TextStyle(
                          fontSize: deviceSize.height * 0.029,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey,
                      blurRadius: 10.0,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(
                      deviceSize.height * 0.3,
                      deviceSize.height * 0.3,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

List<VitalsModels> vitalsModels = [
  VitalsModels(
      icon: 'assets/images/blood-pressure.svg',
      text: 'Glucose & pressure',
      id: 1,
      screenName: BloodPressureAndGlucoseScreen.screenName),
  VitalsModels(
      icon: 'assets/images/oxygen-tank.svg',
      text: 'Oxygen',
      id: 2,
      screenName: OxygenScreen.screenName),
  VitalsModels(
      icon: 'assets/images/heart-rate-monitor.svg',
      text: 'Heart rate',
      id: 3,
      screenName: HeartRateScreen.screenName),
  /*VitalsModels(
      icon: 'assets/images/glucometer.svg',
      text: 'Glucose',
      id: 4,
      screenName: GlucoseScreen.screenName),*/
  VitalsModels(
      icon: 'assets/images/thermometer.svg',
      text: 'Temprature',
      id: 5,
      screenName: TempratureScreen.screenName),
  VitalsModels(
      icon: 'assets/images/heart-rate-monitor.svg',
      text: 'ECG',
      id: 6,
      screenName: EcgScreen.screenName),
  VitalsModels(
      icon: 'assets/images/bluetooth.svg',
      text: 'Connection',
      id: 9,
      screenName: ConnectionScreen.screenName),
  VitalsModels(
      icon: 'assets/images/medical-history.svg',
      text: 'Measurements history',
      id: 7,
      screenName: MeasurementHistoryScreen.screenName),
  VitalsModels(
      icon: 'assets/images/plus.svg',
      text: 'Rate doctor',
      id: 8,
      screenName: RateDoctorScreen.screenName),
];
