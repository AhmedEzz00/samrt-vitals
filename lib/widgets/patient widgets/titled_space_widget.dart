import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget titledSpaceWidget({String? titleText ,double? fontSize, List<Widget>? widgets}) {
  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 20),
          child: Text(
            titleText!,
            //'Blod pressure measurement:',
            style: TextStyle(
              fontSize: fontSize, //deviceSize.height * 0.03,
              color: Colors.blue[900],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: widgets!,
          ),
        )
      ],
    ),
  );
}
/*              provider.gp.length < 4
                  ? Text('\n No measurements yet')
                  : Text(provider.gp[3].toString()),
              SizedBox(
                height: 5,
              ),
              provider.gp.length < 5
                  ? Text('\n No measurements yet')
                  : Text(
                      provider.gp[4].toString(),
                    ),
              SizedBox(
                height: 20,
              ),

              */