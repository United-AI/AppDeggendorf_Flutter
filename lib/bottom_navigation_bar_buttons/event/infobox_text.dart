import 'package:flutter/material.dart';


class InfoBox extends StatefulWidget {
  const InfoBox({Key? key}) : super(key: key);

  @override
  State<InfoBox> createState() => _InfoBoxState();
}

class _InfoBoxState extends State<InfoBox> {
  final List<BoxShadow> boxShadowsList = [
    BoxShadow(color: Colors.black38,blurRadius: 3, spreadRadius: 3)
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5, 15, 5, 10),
      child: Container(
          margin: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.lightGreen,
              width: 5,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: boxShadowsList,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelWithInfo(label: "Adersse"),
                LabelWithInfo(label: "Musikthemen"),
                LabelWithInfo(label: "Eintrittstregeln"),
                LabelWithInfo(label: "Beschreibung"),
              ],
            ),
          )
      ),
    );
  }
}

class LabelWithInfo extends StatefulWidget {
  const LabelWithInfo({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  State<LabelWithInfo> createState() => _LabelWithInfoState();
}

class _LabelWithInfoState extends State<LabelWithInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${widget.label}: ", style: TextStyle(fontSize: 20),),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(30, 3, 0, 0),
          child: Text("some information\nnoch etwas", style: TextStyle(fontSize: 14),),
        )
      ],
    );
  }
}