import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  _QrScannerState createState() => _QrScannerState();
}

class _QrScannerState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(color: Colors.greenAccent));
  }
}
