import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

bool buttonStatus = false;
void buttonStatusToggle() {
  buttonStatus !=buttonStatus;
}



Widget circularButton(Size deviceSize) {
  return OutlineGradientButton(
    inkWell: true,
    onTap: () {
      print('hhh');
    },
    gradient: LinearGradient(
      colors: [Colors.blue, Colors.black],
      begin: Alignment(-1, -1),
      end: Alignment(2, 2),
    ),
    strokeWidth: 8,
    child: SizedBox(
      width: deviceSize.width * 0.27,
      height: deviceSize.width * 0.27,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Text(
            'Measure',
            style: TextStyle(
                fontSize: deviceSize.height * 0.03, color: Colors.blue[900]),
          ),
        ),
      ),
    ),
    radius: Radius.circular(70.0),
  );
}
