import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          "Einstellungen",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            StandardSettingButton(xOffset: 150, title: "Kennwort", label: "",),
            StandardSettingButton(xOffset: 127, title: "Benutzername", label: ""),
            DropdownSettingButton()
          ],
        ),
      ),
    );
  }
}

class DropdownSettingButton extends StatefulWidget {
  const DropdownSettingButton({Key? key}) : super(key: key);

  @override
  State<DropdownSettingButton> createState() => _DropdownSettingButtonState();
}

class _DropdownSettingButtonState extends State<DropdownSettingButton> {
  bool _expanded = false;
  String currentCity = "Deggendorf";

  getCurrentCityFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String val = prefs.getString('currentCity') ?? "Not Selected";
    currentCity = val;
  }

  setCurrentCityInSharedPreferences(String newCity) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('currentCity', newCity);
  }


  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      animationDuration: Duration(microseconds: 2000),
      children:[
        ExpansionPanel(
            canTapOnHeader: true,
            isExpanded: _expanded,
            headerBuilder: (context, isExpanded){
              return ListTile(
                title: Text(currentCity,
                    style: TextStyle(fontSize: 22, color: Color.fromRGBO(
                        1, 1, 1, 0.49411764705882355))
                ),
              );
            },
            body: Column(
              children: <Widget> [
                TextButton(
                    onPressed: (){
                      setCurrentCityInSharedPreferences("Deggendorf");
                      _expanded = false;
                      getCurrentCityFromSharedPreferences();
                      setState(() {
                      });
                    },
                    child: Text(
                      "Deggendorf", style: TextStyle(fontSize: 20, color: Color.fromRGBO(
                        1, 1, 1, 0.49411764705882355)),
                    )
                ),
                TextButton(
                    onPressed: (){
                      setCurrentCityInSharedPreferences("Plattling");
                      _expanded = false;
                      getCurrentCityFromSharedPreferences();
                      setState(() {
                      });
                    },
                    child: Text(
                      "Plattling", style: TextStyle(fontSize: 20, color: Color.fromRGBO(
                        1, 1, 1, 0.49411764705882355)),
                    )
                ),
              ],
            )
        )
      ],
      expansionCallback: (panelIndex, isExpanded){
        _expanded = !_expanded;
        setState(() {

        });
      },
    );
  }
}


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
                      1, 1, 1, 0.49411764705882355)),
                ),
                Text(
                  "drücken um das ${widget.title} zu ändern",
                  style: TextStyle(fontSize: 10, color: Color.fromRGBO(
                      1, 1, 1, 0.3764705882352941)),
                )
              ],
            ),
            SizedBox(
              width: widget.xOffset,
            ),
            Icon(
              Icons.keyboard_arrow_right_rounded,
              color: Color.fromRGBO(1, 1, 1, 0.49411764705882355),
              size: 40,
            )
          ],
        )
    );
  }
}
