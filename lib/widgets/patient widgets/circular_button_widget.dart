import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:provider/provider.dart';
import '../../providers/bluetooth_provider.dart';

// ignore: must_be_immutable
class CircularButton extends StatefulWidget {
  final onPressed;
  CircularButton(this.onPressed);
  bool buttonStatus = false;

  @override
  _CircularButtonState createState() => _CircularButtonState();
}

class _CircularButtonState extends State<CircularButton> {
  late BluetoothProvider bluetoothProvider;
  bool measurePressed = false;
  //Timer? _timer;
  // int _start = 5;

  /* void startTimer() {
    widget.onPressed();
    if (!mounted) {
      return;
    }
    setState(() {
      measurePressed = true;
    });
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          if (!mounted) {
            return;
          }
          setState(() {
            measurePressed = false;
            _start = 5;
            timer.cancel();
          });
        } else {
          if (!mounted) {
            return;
          }
          setState(() {
            _start--;
          });
        }
      },
    );
  }
*/
  @override
  void dispose() {
    /* if (_timer != null) {
      _timer!.cancel();
    }*/

    bluetoothProvider.closeScreen();
    super.dispose();
  }

  void widgetOnPressed() {
    widget.onPressed();
    // setState(() {
    //  measurePressed = true;
    // });
  }

  @override
  Widget build(BuildContext context) {
    bluetoothProvider = Provider.of<BluetoothProvider>(context, listen: false);
    Size deviceSize = MediaQuery.of(context).size;
    return OutlineGradientButton(
      inkWell: true,
      onTap: bluetoothProvider.isMeasuring ? () {} : widgetOnPressed,
      gradient: LinearGradient(
        colors: [Colors.blue, Colors.black],
        begin: Alignment(-1, -1),
        end: Alignment(2, 2),
      ),
      strokeWidth: 8,
      child: SizedBox(
        width: deviceSize.width * 0.35,
        height: deviceSize.width * 0.35,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: bluetoothProvider.isMeasuring
                ? /* Text(
                    '$_start',
                    style: TextStyle(
                        fontSize: deviceSize.height * 0.05,
                        color: Colors.blue[900]),
                  )*/
                Lottie.asset(
                    'assets/animation/animation.json',
                    repeat: true,
                  )
                : FittedBox(
                    child: Text(
                      'Measure',
                      style: TextStyle(
                          fontSize: deviceSize.height * 0.04,
                          color: Colors.blue[900]),
                      maxLines: 3,
                    ),
                  ),
          ),
        ),
      ),
      radius: Radius.circular(200.0),
    );
  }
}







/*Widget circularButton(Size deviceSize,Function onPressed) {
  return OutlineGradientButton(
    inkWell: true,
    onTap: (){onPressed;},
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
*/