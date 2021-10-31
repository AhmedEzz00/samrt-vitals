import 'package:flutter/material.dart';

import '../../themes.dart';

// ignore: must_be_immutable
class DocInfoWidget extends StatelessWidget {
  final IconData? icony;
  final String? title;
  final String? subtitle;
  bool isRate;
  DocInfoWidget({
    @required this.icony,
    @required this.title,
    @required this.subtitle,
    this.isRate = false,
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
                  color: isRate ? Colors.amber : MyThemes.primaryColor,
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
