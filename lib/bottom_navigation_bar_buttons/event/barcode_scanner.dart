import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:deggendorf_app/bottom_navigation_bar_buttons/settings/settings.dart';

class BarcodeScanner extends StatefulWidget {
  const BarcodeScanner({Key? key}) : super(key: key);

  @override
  _BarcodeScannerWidget createState() => _BarcodeScannerWidget();
}

class _BarcodeScannerWidget extends State<BarcodeScanner> {


  @override
  Widget build(BuildContext context) {
    var x = startBarcodeScanStream();
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
          child: Column(
            children: [
              Text(x.toString()),
              ElevatedButton(
                onPressed:() {
              Navigator.pop(context);
                },
                child: const Text("Return"),
              ),
            ],
          )),
    );
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }
}
