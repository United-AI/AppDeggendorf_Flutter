import 'package:flutter/material.dart';
import 'package:deggendorf_app/bottom_navigation_bar_buttons/event/imageslides.dart';


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
        title: Text(
          "Bar: ${widget.barName}", style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ImageSlides(),
          ],
        )
      ),
    );
  }
}


