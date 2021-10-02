// ignore_for_file: unnecessary_statements

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bluetoothDevice extends StatefulWidget {
  final deviceName;
  final onPressed;
  //final status;

  bluetoothDevice(
    this.deviceName,
    this.onPressed,
  );

  @override
  _bluetoothDeviceState createState() => _bluetoothDeviceState();
}

class _bluetoothDeviceState extends State<bluetoothDevice> {
  @override
  Widget build(BuildContext context) {
    //  bool connectionState= false;

    //setState(() {
    // connectionState= widget.status;
    // });

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InkWell(
                autofocus: true,
                splashColor: Colors.grey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.bluetooth,
                          color: Colors.blue[600],
                        ),
                      ),
                      TextSpan(
                        text: '  ${widget.deviceName!}',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )
                    ]),
                  ),
                ),
                onTap: widget.onPressed,
              ),
            ),
            IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () {},
              splashColor: Colors.grey,
            ),
            /*MaterialButton(
                color: Colors.blue[900],
                onPressed: widget.onPressed,
                child: Text('Connect')),*/
          ],
        ),
      ),
    );
  }
}
//autofocus: true,
  //      splashColor: Colors.grey,

//Widget bluetoothDevice(String? deviceName,Future onPressed,String? status) 
