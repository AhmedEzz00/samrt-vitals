import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_vitals/themes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HistoryScreen extends StatelessWidget {
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
      initialIndex: 1,
      length: _kTabs.length,
      child: Scaffold(
        backgroundColor: MyThemes.lightTheme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: MyThemes.primaryColor,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(FontAwesomeIcons.history),
            )
          ],
          title: Row(
            children: [
              Text(' Medical History'),
            ],
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
                    child: Center(
                      child: Text(
                        'Temperature',
                        style: MyThemes.lightTheme.textTheme.bodyText1,
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        'Glucose',
                        style: MyThemes.lightTheme.textTheme.bodyText1,
                      ),
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
