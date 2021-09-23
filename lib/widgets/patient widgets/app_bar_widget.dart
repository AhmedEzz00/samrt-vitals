import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBarWidget(String text){
  return AppBar( 
        title: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}