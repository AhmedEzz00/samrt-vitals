import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget latestMeasurementItem(
  BuildContext context,
  String image,
  String text,
  //String value
) {
  Size deviceSize = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: deviceSize.width * 0.17,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: deviceSize.height * 0.09,
            width: deviceSize.width * 0.15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.blue.shade900,
                width: 2,
              ),
              color: Colors.white,
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: SvgPicture.asset(
                  '$image',
                  height: deviceSize.height * 0.06,
                  width: deviceSize.width * 0.05,
                ),
              ),
            ),
          ),
          FittedBox(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: deviceSize.height * 0.016,
              ),
              maxLines: 1,
            ),
          ),
          //Text(value)
        ],
      ),
    ),
  );
}
