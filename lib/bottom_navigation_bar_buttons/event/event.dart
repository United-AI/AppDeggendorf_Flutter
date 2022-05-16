import 'package:deggendorf_app/bottom_navigation_bar_buttons/event/super_user_events/add_new_event_form.dart';
import 'package:deggendorf_app/lib/database/app_database.dart';
import 'package:deggendorf_app/lib/db_model/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class ListOfEvents {
  late List<Event> events;

  ListOfEvents() {
    events = [];
  }
}

class _EventsPageState extends State<EventsPage> {
  //This boolean variable is used for the checkboxes
  bool _value = false;

  // Load all events
  ListOfEvents listOfEvents =
      new ListOfEvents(); //= [new Event(name: "Es gibt zu diesem Zeitpunkt kein Event.", dateStart: new DateTime.now(), dateFinish: new DateTime.now(), location: "DEG")];
  bool isLoading = false;

  final appDatabase = AppDatabase.init();

  @override
  void initState() {
    super.initState();

    refreshEvents();
  }

  @override
  void dispose() {
    AppDatabase.instance.close();

    super.dispose();
  }

  Future refreshEvents() async {
    setState(() => isLoading = true);

    this.listOfEvents.events = await AppDatabase.instance.readAllEvents();

    setState(() => isLoading = false);
  }

  /*This list contains the elements to be displayed on the event page.
  These elements were originally thought to be bars which once clicked upon
  are marked as checked.
  If you want to add a new item to the scrollable list, add it in this list;
  more specifically in the method initializeMyList.
  */
  List<Widget> myListToBeDisplayed = [];

  /*If you need to add a new item to the list, add it here.
  */
  /*
  void initializeMyList() {
    myListToBeDisplayed = [
      sizedBox("Bar 1", "Mehr Informationen über Bar 1",
          Icons.local_bar_rounded, 100, BarWidget(barName: "Erster",)),
      sizedBox("Bar 2", "Mehr Informationen über Bar 1",
          Icons.local_bar_rounded, 200, BarWidget(barName: "Ostern",)),
      sizedBox("Bar 3", "Mehr Informationen über Bar 3",
          Icons.local_bar_rounded, 100, BarWidget(barName: "Hallo Welt",)),
      sizedBox("Bar 4", "Mehr Informationen über Bar 4",
          Icons.local_bar_rounded, 100, BarWidget(barName: "ITC1",)),
      sizedBox("Bar 5", "Mehr Informationen über Bar 5",
          Icons.local_bar_rounded, 100, BarWidget(barName: "THD",)),
      sizedBox("Bar 6", "Mehr Informationen über Bar 6",
          Icons.local_bar_rounded, 100, BarWidget(barName: "First Floor",)),
    ];
  }*/

  @override
  Widget build(BuildContext context) {
    //initializeMyList();
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text("Eventname"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: listOfEvents.events.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listOfEvents.events[index].name),
            trailing: PopupMenuButton(
              itemBuilder: (ctx) => [
                PopupMenuItem(child: Text("Delete")),
                PopupMenuItem(child: Text("Edit")),
              ],
            ),
          );
        }, // itemBuilder
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
              onTap: () {
                //If the widget tapped is the weather widget, then open weather page :)
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddNewEvent(listOfEvents)));
              },
              child: Icon(Icons.info),
              label: 'Add new event',
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
  SizedBox sizedBox(String name, String dateStart, IconData iconData,
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
            title: Text(EventFields.name),
            subtitle: Text(EventFields.dateStart),
            secondary: Icon(iconData),
            activeColor: Colors.green,
            checkColor: Colors.white,
            selected: _value,
            value: _value,
            onChanged: (bool? value) {
              //This piece of code can be used to change the value of the checkbox upon click.
              //It is commented because it is not used here.
              /* setState(() {
                _value = value!;
              }*/
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => navigateTo,
                  ));
            },
          ), //CheckboxListTile
        ), //Container
      ), //Padding
    );
  }
}
