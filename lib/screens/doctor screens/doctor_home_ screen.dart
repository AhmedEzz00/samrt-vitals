import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      onTap: () {},
                      title: Text('patient1'),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('spo2    =>    20'),
                            Text('hr    =>    20'),
                            Text('sys    =>    30'),
                            Text('dia    =>    40'),
                            Text('sug    =>   50'),
                          ],
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 20,
            ),
          ),
        ],
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
