import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_vitals/providers/bluetooth_provider.dart';
import 'package:smart_vitals/widgets/patient%20widgets/bluetooth_device_item_widget.dart';

class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({Key? key}) : super(key: key);
  static const screenName = 'ReceiveMeasurements';

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  Future<void> providerScan(Function function) async {}
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // The code in this block will be executed after the build method
      context.read<BluetoothProvider>().startScanning();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('buid');
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
        body: Consumer<BluetoothProvider>(builder: (context, provider, _) {
          return provider.targetDevices.isEmpty
              ? Text('empty')
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return bluetoothDevice(
                      provider.targetDevices.elementAt(index).name,
                      provider.connect(
                          provider.targetDevices.elementAt(index).address),
                      provider.getConnectionState(
                          provider.targetDevices.elementAt(index).address),
                    );
                  },
                  itemCount: provider.targetDevices.length,
                );
        }));
  }
}
