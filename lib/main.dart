import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_vitals/providers/bluetooth_provider.dart';
import 'package:smart_vitals/screens/patient%20screens/main%20screens/patient_main_screen.dart';
import 'package:smart_vitals/screens/patient%20screens/vitals%20screens/patient_additional_services_screen.dart';
import 'package:smart_vitals/screens/patient%20screens/vitals%20screens/patient_blood_pressure_screen.dart';
import 'package:smart_vitals/screens/patient%20screens/vitals%20screens/patient_ecg_screen.dart';
import 'package:smart_vitals/screens/patient%20screens/vitals%20screens/patient_glocuse_screen.dart';
import 'package:smart_vitals/screens/patient%20screens/vitals%20screens/patient_heart_rate_screen.dart';
import 'package:smart_vitals/screens/patient%20screens/vitals%20screens/patient_oxygen_screen.dart';
import 'package:smart_vitals/screens/patient%20screens/vitals%20screens/patient_rate_doctor_screen.dart';
import 'package:smart_vitals/screens/patient%20screens/vitals%20screens/patient_Connection_screen.dart';
import 'package:smart_vitals/screens/patient%20screens/vitals%20screens/patient_temprature_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.blue[800],
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: BluetoothProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(),
        initialRoute: '/',
        routes: {
          AdditionalServicesScreen.screenName: (context) =>
              AdditionalServicesScreen(),
          BloodPressureAndGlucoseScreen.screenName: (context) =>
              BloodPressureAndGlucoseScreen(),
          EcgScreen.screenName: (context) => EcgScreen(),
          GlucoseScreen.screenName: (context) => GlucoseScreen(),
          HeartRateScreen.screenName: (context) => HeartRateScreen(),
          OxygenScreen.screenName: (context) => OxygenScreen(),
          RateDoctorScreen.screenName: (context) => RateDoctorScreen(),
          ConnectionScreen.screenName: (context) => ConnectionScreen(),
          TempratureScreen.screenName: (context) => TempratureScreen(),
        },
        home: PatientMainScreen(),
      ),
    );
  }
}
