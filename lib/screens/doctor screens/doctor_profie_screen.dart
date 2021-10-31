import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_vitals/themes.dart';

class DoctorProfileScreen extends StatefulWidget {
  @override
  _DoctorProfileScreenState createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    //  var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyThemes.primaryColor,
        title: Text(
          'Dr Profile',
          style: MyThemes.lightTheme.appBarTheme.titleTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      'assets/images/profile.png',
                      height: 90,
                      width: 90,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        ' Dr. Osama',
                        style: MyThemes.lightTheme.textTheme.headline3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'surgeon',
                          style: MyThemes.lightTheme.textTheme.bodyText2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              DocInfoWidget(
                icony: FontAwesomeIcons.envelope,
                title: 'Email',
                subtitle: 'osama@gmail.com',
              ),
              DocInfoWidget(
                icony: FontAwesomeIcons.child,
                title: 'Age',
                subtitle: '54',
              ),
              DocInfoWidget(
                icony: FontAwesomeIcons.venusMars,
                title: 'Geneder',
                subtitle: 'Male',
              ),
              DocInfoWidget(
                icony: FontAwesomeIcons.locationArrow,
                title: 'Location',
                subtitle: 'Cairo',
              ),
              DocInfoWidget(
                icony: Icons.star,
                title: 'Rating',
                subtitle: '7.5',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DocInfoWidget extends StatelessWidget {
  final IconData? icony;
  final String? title;
  final String? subtitle;
  DocInfoWidget({
    @required this.icony,
    @required this.title,
    @required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20.0,
                child: Icon(
                  icony,
                  color: MyThemes.primaryColor,
                  size: 30,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              VerticalDivider(
                thickness: 1,
                width: 1,
              ),
            ],
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 2.0,
              horizontal: 20,
            ),
            child: Text(
              title ?? '',
              style: MyThemes.lightTheme.textTheme.bodyText1,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 2.0,
              horizontal: 20,
            ),
            child: Text(
              subtitle ?? '',
              style: MyThemes.lightTheme.textTheme.bodyText2,
            ),
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
        ),
      ],
    );
  }
}
