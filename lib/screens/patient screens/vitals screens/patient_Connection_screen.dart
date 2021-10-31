import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/bluetooth_provider.dart';
import '../../../widgets/patient%20widgets/bluetooth_device_item_widget.dart';

class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({Key? key}) : super(key: key);
  static const screenName = 'ReceiveMeasurements';

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  Future<void> providerScan(Function function) async {}
  late BluetoothProvider _bluetoothProvider =
      Provider.of<BluetoothProvider>(context, listen: false);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // The code in this block will be executed after the build method

      _bluetoothProvider.startScanning();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    print('patient connection screen');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(
            'Connection',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Consumer<BluetoothProvider>(builder: (context, provider, _) {
            return _bluetoothProvider.targetDevices.isEmpty
                ? Text('empty')
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return BluetoothDevice(
                        _bluetoothProvider.targetDevices.elementAt(index).name,
                        () {
                          _bluetoothProvider.connect(_bluetoothProvider
                              .targetDevices
                              .elementAt(index)
                              .address);
                        },
                        /*_bluetoothProvider.getConnectionState(_bluetoothProvider
                            .targetDevices
                            .elementAt(index)
                            .address)*/
                      );
                    },
                    itemCount: _bluetoothProvider.targetDevices.length,
                    separatorBuilder: (context, index) {
                      return Center(
                        child: Container(
                          height: 1,
                          width: deviceSize.width * 0.6,
                          color: Colors.blue,
                        ),
                      );
                    },
                  );
          }),
        ));
  }
}
