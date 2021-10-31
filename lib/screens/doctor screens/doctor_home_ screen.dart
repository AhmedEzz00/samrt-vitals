import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../themes.dart';

class DoctorHomeScreen extends StatefulWidget {
  @override
  _DoctorHomeScreenState createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  // _PatientsState createState() => _PatientsState();
  createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('enter patient id'),
            content: TextField(
              controller: customController,
            ),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {},
                elevation: 5.0,
                child: Text('Add'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Patients',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onTap: () {},
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Mohsen',
                      style: MyThemes.lightTheme.textTheme.headline3,
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.pumpMedical),
                      title: Text('Pressure'),
                      trailing: Text('20'),
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.lungs),
                      title: Text('SPO2'),
                      trailing: Text('20'),
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.heartbeat),
                      title: Text('Heart Rate'),
                      trailing: Text('30'),
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.thermometerHalf),
                      title: Text('Temperature '),
                      trailing: Text('30'),
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.syringe),
                      title: Text('Glucose'),
                      trailing: Text('30'),
                    ),
                  ],
                ),
              ),
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),
          );
        },
        itemCount: 20,
        separatorBuilder: (context, index) => Container(
          height: 1.5,
          color: Colors.grey[200],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*  Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DrServicies())); */
        },
        child: const Icon(Icons.home_repair_service, color: Colors.white),
      ),
    );
  }
}
