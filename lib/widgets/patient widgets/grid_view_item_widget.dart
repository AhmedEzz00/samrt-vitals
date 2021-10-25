import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


Widget gridViewItem(
  BuildContext context,
  String image,
  String text,
  String routeName,
) {
  Size deviceSize = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, routeName);
    },
    child: Container(
      margin: EdgeInsetsDirectional.only(
          end: deviceSize.width * 0.02, start: deviceSize.width * 0.02),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade900, width: 3.0),
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: SvgPicture.asset(
              '$image',
              height: deviceSize.height * 0.09,
              width: deviceSize.width * 0.09,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
              child: Text(
                '$text',
                style: TextStyle(
                  fontSize: deviceSize.width*0.035,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
                textScaleFactor: 0.99,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
