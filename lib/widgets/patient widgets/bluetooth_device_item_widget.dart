// ignore_for_file: unnecessary_statements

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class bluetoothDevice extends StatefulWidget {
  
  final deviceName;
  final onPressed;
  final status;

  bluetoothDevice(this.deviceName,this.onPressed,this.status);

  
  @override
  _bluetoothDeviceState createState() => _bluetoothDeviceState();
}

class _bluetoothDeviceState extends State<bluetoothDevice> {


  

  @override
  Widget build(BuildContext context) {

    bool connectionState= false;

    setState(() {
      connectionState= widget.status;
    });

    return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.deviceName!,style: TextStyle(color: Colors.black),),
        MaterialButton(
          color: Colors.blue[900],
          onPressed:(){widget.onPressed;},
          child: connectionState ? Text('Disconnect',style: TextStyle(color: Colors.white),):Text('Connect')
        ),
      ],
    ),
  );
  }
}


//Widget bluetoothDevice(String? deviceName,Future onPressed,String? status) 
