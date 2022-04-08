import 'package:flutter/material.dart';


class StandardSettingButton extends StatefulWidget {
  const StandardSettingButton({Key? key,
    required this.xOffset,
    required this.title,
    required this.label
  }) : super(key: key);

  final double xOffset;
  final String title;
  final String label;

  @override
  State<StandardSettingButton> createState() => _StandardSettingButtonState();
}

class _StandardSettingButtonState extends State<StandardSettingButton> {

  bool isPassword(){
    if (widget.title == "Kennwort"){
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: (){
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                "Wollen Sie ${widget.title} ändern?",
                style: TextStyle(
                    fontSize: 16
                ),
              ),
              content: TextField(
                obscureText: isPassword() ,
                decoration: InputDecoration(
                    hintText: "geben Sie ${widget.title} ein"
                ),
              ),
              actions: [
                TextButton(
                    onPressed: (){Navigator.pop(context);},
                    child: Text("ändern")
                ),
                TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("abbrechen")
                )
              ],
            ),
          );
        },
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 25, color: Color.fromRGBO(
                      1, 1, 1, 0.5)),
                ),
                Text(
                  "drücken um das ${widget.title} zu ändern",
                  style: TextStyle(fontSize: 10, color: Color.fromRGBO(
                      1, 1, 1, 0.37)),
                )
              ],
            ),
            SizedBox(
              width: widget.xOffset,
            ),
            Icon(
              Icons.keyboard_arrow_right_rounded,
              color: Color.fromRGBO(1, 1, 1, 0.5),
              size: 40,
            )
          ],
        )
    );
  }
}