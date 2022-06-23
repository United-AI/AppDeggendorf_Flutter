import 'package:flutter/material.dart';
import 'package:deggendorf_app/bottom_navigation_bar_buttons/event/event_container/imageslides.dart';
import 'package:deggendorf_app/bottom_navigation_bar_buttons/event/event_container/infobox_text.dart';


class BarWidget extends StatefulWidget {
  const BarWidget({Key? key,
  required this.barName}) : super(key: key);

  final String barName;

  @override
  State<BarWidget> createState() => _BarWidgetState();
}

class _BarWidgetState extends State<BarWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Bar: ${widget.barName}", style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ImageSlides(),
            InfoBox(),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.green,
        child: Icon(Icons.qr_code_scanner),
      )
    );
  }
}