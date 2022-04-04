import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DropdownSettingButton extends StatefulWidget {
  const DropdownSettingButton({Key? key}) : super(key: key);

  @override
  State<DropdownSettingButton> createState() => _DropdownSettingButtonState();
}

class _DropdownSettingButtonState extends State<DropdownSettingButton> {
  bool _expanded = false;
  String currentCity = "Die aktuelle Stadt ändern";

  String getCurrentCity(){
    getCurrentCityFromSharedPreferences();
    return currentCity;
  }

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
              String city = getCurrentCity();
              return ListTile(
                title: Text(city,
                    style: TextStyle(fontSize: 20, color: Color.fromRGBO(
                        1, 1, 1, 0.5))
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
                      "Deggendorf",
                      style: TextStyle(fontSize: 20, color: Color.fromRGBO(
                          1, 1, 1, 0.5)),
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
                      "Plattling",
                      style: TextStyle(fontSize: 20, color: Color.fromRGBO(
                          1, 1, 1, 0.5)),
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