import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget patientMeasurementsHistoryItem({String? icon,List<Text>? measurement, List<Widget>? history}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FittedBox(child: SvgPicture.asset(icon!),fit:BoxFit.contain,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: measurement!,
              ),
            ),
            SizedBox(width: 20.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: history!,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
