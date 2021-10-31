import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/patient%20models/vitals_models.dart';
import '../../../widgets/patient%20widgets/latest_measurement_item_widget.dart';

class PatientProfile extends StatelessWidget {
  const PatientProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: deviceSize.height * 0.18,
            child: Center(
              child: Text(
                'Profile',
                style: TextStyle(
                    color: Colors.white, fontSize: deviceSize.height * 0.06),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(90.0),
              ),
              gradient: gradientColors,
            ),
          ),
          SizedBox(height: deviceSize.height * 0.02),
          Container(
            color: Colors.grey[200],
            height: deviceSize.height * 0.18,
            child: Row(
              children: [
                SizedBox(
                  width: deviceSize.width * 0.07,
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.blue,
                        style: BorderStyle.solid,
                        width: deviceSize.width * 0.007),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.asset('assets/images/profile.png'),
                  ),
                ),
                SizedBox(
                  width: deviceSize.width * 0.03,
                ),
                Text(
                  'Ahmed Osama',
                  style: TextStyle(
                      fontSize: deviceSize.height * 0.03,
                      color: Colors.blue[900]),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 20),
            child: Text(
              'User information:',
              style: TextStyle(
                fontSize: deviceSize.height * 0.03,
                color: Colors.blue[900],
              ),
            ),
          ),
          SizedBox(
            height: deviceSize.height * 0.02,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email: ',
                    style: userInformationTextStyle,
                  ),
                  Text(
                    'Age: ',
                    style: userInformationTextStyle,
                  ),
                  Text(
                    'Gender: ',
                    style: userInformationTextStyle,
                  ),
                  Text(
                    'Doctor Id:',
                    style: userInformationTextStyle,
                  ),
                  Text(
                    'Partner Id: ',
                    style: userInformationTextStyle,
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.02,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: deviceSize.height * 0.012,
            color: Colors.grey[200],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 20),
            child: Text(
              'Latest measurements',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: deviceSize.height * 0.03,
                color: Colors.blue[900],
              ),
            ),
          ),
          SizedBox(
            height: deviceSize.height * 0.017,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: vitalsModels.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 5, left: 5),
                child: latestMeasurementItem(
                  context,
                  vitalsModels.elementAt(index).icon,
                  vitalsModels.elementAt(index).text,
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                width: deviceSize.width * 0.001,
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<VitalsModels> vitalsModels = [
  VitalsModels(
    icon: 'assets/images/blood-pressure.svg',
    text: 'Blood pressure',
    id: 1,
  ),
  VitalsModels(
    icon: 'assets/images/oxygen-tank.svg',
    text: 'Oxygen',
    id: 2,
  ),
  VitalsModels(
    icon: 'assets/images/heart-rate-monitor.svg',
    text: 'Heart rate',
    id: 3,
  ),
  VitalsModels(
    icon: 'assets/images/glucometer.svg',
    text: 'Glucose',
    id: 4,
  ),
  VitalsModels(
    icon: 'assets/images/thermometer.svg',
    text: 'Temprature',
    id: 5,
  ),
];
