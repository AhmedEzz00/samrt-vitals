import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothProvider with ChangeNotifier {
  // ignore: non_constant_identifier_names

  List<dynamic> gp = [];
  List<dynamic> ecg=[];
  List<BluetoothDevice> targetDevices = [];
  FlutterBluetoothSerial flutterBluetoothSerial =
      FlutterBluetoothSerial.instance;
  late BluetoothConnection connection;
  String _messageBuffer = '';
  String? latestMeasurement;
  String? request;
  bool isMeasuring = false;
  var counter= 0;

  void closeScreen() {
    isMeasuring = false;
    removeListener(() {});
  }

  startScanning() async {
    await flutterBluetoothSerial
        .getBondedDevices()
        .then((value) => targetDevices = value);
    flutterBluetoothSerial.cancelDiscovery();

    notifyListeners();
  }

  connect(address) async {
    try {
      connection =
          await BluetoothConnection.toAddress(address).then((_cnnection) async {
        connection = _cnnection;
        connection.input!.listen(_onDataReceived);
        return connection;
      });
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  bool getConnectionState(address) {
    return BluetoothDevice(address: address).isConnected;
  }

  _onDataReceived(Uint8List data) {
    // Allocate buffer for parsed data
    int backspacesCounter = 0;
    data.forEach((byte) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    });
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;

    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }
    // Create message if there is new line character
    String dataString = String.fromCharCodes(buffer);
    int index = buffer.indexOf(13);
    if (~index != 0) {
      switch (request) {
        case '0':
          gp.add(backspacesCounter > 0
              ? _messageBuffer.substring(
                  0, _messageBuffer.length - backspacesCounter)
              : _messageBuffer + dataString.substring(0, index));
          _messageBuffer = dataString.substring(index);
          print('$gp');
          break;

        case '1':
          latestMeasurement = backspacesCounter > 0
              ? _messageBuffer.substring(
                  0, _messageBuffer.length - backspacesCounter)
              : _messageBuffer + dataString.substring(0, index);
          _messageBuffer = dataString.substring(index);
          print('$latestMeasurement');
          break;

        case '2':
          latestMeasurement = backspacesCounter > 0
              ? _messageBuffer.substring(
                  0, _messageBuffer.length - backspacesCounter)
              : _messageBuffer + dataString.substring(0, index);
          _messageBuffer = dataString.substring(index);
          print('$latestMeasurement');
          break;
        case '4':
          ecg.add(backspacesCounter > 0
              ? _messageBuffer.substring(
                  0, _messageBuffer.length - backspacesCounter)
              : _messageBuffer + dataString.substring(0, index));
          _messageBuffer = dataString.substring(index);
          print('${ecg.last}');
          counter++;
          break;

        default:
      }
    } else {
      _messageBuffer = (backspacesCounter > 0
          ? _messageBuffer.substring(
              0, _messageBuffer.length - backspacesCounter)
          : _messageBuffer + dataString);
    }
    isMeasuring = false;
    notifyListeners();
  }

  sendData(String data) async {
    gp.clear();
    latestMeasurement=null;
    isMeasuring = true;
    notifyListeners();
    request = data;
    if (data.length > 0) {
      try {
        connection.output.add(ascii.encode(data + "\r\n"));
        await connection.output.allSent;
      } catch (error) {
        print(error.toString());
      }
    }
  }

  checkAdapter() {
    if (flutterBluetoothSerial.state.toString() ==
        BluetoothState.STATE_OFF.toString()) {
      flutterBluetoothSerial.requestEnable();
    }
  }
}









/*class BluetoothProvider with ChangeNotifier {
  List<dynamic> bluetoothResults = [];

  var _deviceState;
  var _bluetoothState;

  void bluetoothState() {
    // Get current state
    FlutterBluetoothSerial.instance.state.then((state) {
      
        _bluetoothState = state;
    
  

    _deviceState = 0; // neutral

    // If the bluetooth of the device is not enabled,
    // then request permission to turn on bluetooth
    // as the app starts up
    BluetoothHelper.enableBluetooth(_bluetoothState, getPairedDevices);

    // Listen for further state changes
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
        _bluetoothState = state;
        if (_bluetoothState == BluetoothState.STATE_OFF) {
          _isButtonUnavailable = true;
        }
        getPairedDevices();
      });
    });
  }
}
*/

////////////////////////////////////
//flutter_blue


/*
final String SERVICE_UUID = "0000ffe0-0000-1000-8000-00805f9b34fb";
  final String CHARACTERISTIC_UUID = "0000ffe1-0000-1000-8000-00805f9b34fb";
  final String TARGET_DEVICE_NAME = "HC-05";

  FlutterBlue flutterBlue = FlutterBlue.instance;
  StreamSubscription<ScanResult>? scanSubScription;

  List<AdvertisementData> targetDevices = [];
  BluetoothCharacteristic? targetCharacteristic;
  BluetoothState? bluetoothState;

  String connectionText = "";
  String joystick = "";

  startScanning() async {
    await flutterBlue.startScan(
      timeout: Duration(seconds: 10),
    );
    flutterBlue.scanResults.listen((results) {
      // do something with scan results
      for (ScanResult r in results) {
        targetDevices.add(r.advertisementData);
      }
    });

    notifyListeners();
  }

  stopScan() {
    scanSubScription!.cancel();
    //scanSubScription = null;
  }

  /*connectToDevice() async {
    connectionText = "Device Connecting";

    await targetDevice!.connect();
    print("Device Connected");

    connectionText = "Device Connected";
    discoverServices();
    notifyListeners();
  }
*/
  /*disconnectFromDevice() {
    if (targetDevice == null) return;
    targetDevice!.disconnect();

    connectionText = "Device Disconnected";
    notifyListeners();
  }
*/
  /*discoverServices() async {
    if (targetDevice == null) return;

    List<BluetoothService> services = await targetDevice!.discoverServices();
    services.forEach((service) {
      if (service.uuid.toString() == SERVICE_UUID) {
        service.characteristics.forEach((characteristc) {
          if (characteristc.uuid.toString() == CHARACTERISTIC_UUID) {
            targetCharacteristic = characteristc;
            writeData("Connect Complete!\r\n");

            connectionText = "All Ready with ${targetDevice!.name}";
          }
        });
      }
    });
    notifyListeners();
  }*/

  writeData(String data) async {
    if (targetCharacteristic == null) return;

    List<int> bytes = utf8.encode(data);
    await targetCharacteristic!.write(bytes);
    notifyListeners();
  }

*/





/*  late FlutterBlue flutterBlue;

  List<BluetoothDevice> bluetoothDevices = [];

  /* get bluetoothDevices {
    return [..._bluetoothDevices];
  }*/

  void initialize() {
    flutterBlue = FlutterBlue.instance;
  }

  void scanForDevices() async {
    initialize();
     await flutterBlue.startScan(
      timeout: Duration(seconds: 10),
    );
     flutterBlue.scanResults.listen((results) {
      for (ScanResult scanResult in results) {
        bluetoothDevices.add(scanResult.device);
      }
    });
    notifyListeners();
  }*/
///////////////////////////////////////////


//flutter_blluetooth_serial

/*
  List<BluetoothDiscoveryResult> bluetoothResults = [];
  

 scanForDevices() {
  var streamSubscription = FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
    bluetoothResults.add(r);
  });
  /*streamSubscription.onDone(() {
    //Do something when the discovery process ends
  });*/
  streamSubscription.cancel();
}

late BluetoothConnection connection;
connect(String address) async {
  try {
    connection = await BluetoothConnection.toAddress(address);
    print('Connected to the device');

    connection.input!.listen((Uint8List data) {
      //Data entry point
    });

  } catch (exception) {
    print('Cannot connect, exception occured');
  }
}
*/

//////////////////////////


//flutter reactive ble
 
 
 /*void scan() {
    final flutterReactiveBle = FlutterReactiveBle();
    flutterReactiveBle.scanForDevices(
        withServices: [], scanMode: ScanMode.lowLatency).forEach((element) {
            bluetoothResults.add(element);
        });
  }*/