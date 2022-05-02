import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:deggendorf_app/bottom_navigation_bar_buttons/settings/dropdownbutton.dart';
import 'package:deggendorf_app/bottom_navigation_bar_buttons/settings/standardsettingbutton.dart';
import 'package:deggendorf_app/singin/singin.dart';


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
            DropdownSettingButton(),
            TextButton(
                onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SingIn()),);
              },
              child: Text("go to sing in")
              )
          ],
        ),
      ),
    );
  }
}
