import 'package:deggendorf_app/bin/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class EventMainPage extends StatefulWidget {
  const EventMainPage({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<EventMainPage> {
  //This boolean variable is used for the checkboxes
  bool _value = false;

  /*This list contains the elements to be displayed on the event page.
  These elements were originally thought to be bars which once clicked upon
  are marked as checked.
  If you want to add a new item to the scrollable list, add it in this list;
  more specifically in the method initializeMyList.
  */
  List<Widget> myListToBeDisplayed = [];

  /*If you need to add a new item to the list, add it here.
  */
  void initializeMyList() {
    myListToBeDisplayed = [
      sizedBox("Bar 1", "Mehr Informationen über Bar 1",
          Icons.local_bar_rounded, 100, SecondRoute()),
      sizedBox("Bar 2", "Mehr Informationen über Bar 1",
          Icons.local_bar_rounded, 200, SecondRoute()),
      sizedBox("Bar 3", "Mehr Informationen über Bar 3",
          Icons.local_bar_rounded, 100, SecondRoute()),
      sizedBox("Bar 4", "Mehr Informationen über Bar 4",
          Icons.local_bar_rounded, 100, SecondRoute()),
      sizedBox("Bar 5", "Mehr Informationen über Bar 5",
          Icons.local_bar_rounded, 100, SecondRoute()),
      sizedBox("Bar 6", "Mehr Informationen über Bar 6",
          Icons.local_bar_rounded, 100, SecondRoute()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    initializeMyList();
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text("Eventname"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Center(
          child: ListView(
            children: myListToBeDisplayed,
          ),
        ),
      ),
      //This is the floating button at the bottom right of the page.
      floatingActionButton: SpeedDial(
        //edit here to change the colour and opacity of the overlay, when the button is pressed.
        overlayColor: Colors.black,
        overlayOpacity: 0.3,
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.green[700],
        children: [
          SpeedDialChild(
              child: Icon(Icons.info),
              label: 'Option 1',
              backgroundColor: Colors.red),
          SpeedDialChild(
              child: Icon(Icons.phone_android),
              label: 'Option 2',
              backgroundColor: Colors.green)
        ],
      ),
    );
  }

  //This sized box is used in the list myListToBeDisplayed
  SizedBox sizedBox(String mainTitle, String subtitle, IconData iconData,
      double heightOfCheckBox, Widget navigateTo) {
    return SizedBox(
      height: heightOfCheckBox,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green[100],
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(20),
          ), //BoxDecoration
          child: CheckboxListTile(
            title: Text(mainTitle),
            subtitle: Text(subtitle),
            secondary: Icon(iconData),
            activeColor: Colors.green,
            checkColor: Colors.white,
            selected: _value,
            value: _value,
            onChanged: (bool? value) {
              //This piece of code can be used to change the value of the checkbox upon click.
              //It is commented because it is not used here.
              setState(() {
                _value = value!;
              }
    /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => navigateTo,
                  )*/);
            },
          ), //CheckboxListTile
        ), //Container
      ), //Padding
    );
  }


}
