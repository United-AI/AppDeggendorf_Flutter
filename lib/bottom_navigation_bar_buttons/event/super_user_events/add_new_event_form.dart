import 'dart:developer';
//import 'dart:html';

import 'package:deggendorf_app/bottom_navigation_bar_buttons/event/event.dart';
import 'package:flutter/material.dart';

///This form is for the super user. The super user can add a new event with it.
class AddNewEvent extends StatefulWidget {
  ListOfEvents listOfEvents = new ListOfEvents();

  AddNewEvent(ListOfEvents listOfEvents, {Key? key}) : super(key: key) {
    this.listOfEvents = listOfEvents;
  }

  @override
  EditingForm createState() => EditingForm(listOfEvents);
}

class EditingForm extends State<AddNewEvent> {
  ListOfEvents listOfEvents = new ListOfEvents();

  EditingForm(ListOfEvents listOfEvents) {
    this.listOfEvents = listOfEvents;
  }

  @override
  Widget build(BuildContext buildContext) {
    return Container(
        child: Scaffold(
            backgroundColor: Colors.indigo[200],
            appBar: AppBar(
              backgroundColor: Colors.indigo,
              title: const Text("Add a new event"),
            ),
            body: addNewEventForm(listOfEvents)));
  }
}

Form addNewEventForm(ListOfEvents listOfEvents) {
  final eventName = TextEditingController();
  final startingDate = TextEditingController();
  final endingDate = TextEditingController();
  final location = TextEditingController();
  return Form(
      child: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            children: [
              TextFormField(
                controller: eventName,
                decoration: InputDecoration(
                  labelText: 'Event name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: startingDate,
                decoration: InputDecoration(
                  labelText: 'Date start',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: endingDate,
                decoration: InputDecoration(
                  labelText: 'Date finished',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: location,
                decoration: InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(width: 25),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          textStyle: TextStyle(color: Colors.white)),
                      onPressed: () {
                        //Input text is here output.
                        log('${eventName.text}');
                        log('${startingDate.text}');
                        log('${endingDate.text}');
                        log('${location.text}');
                        //The reference of the listOfEvents has been passed down to here. Now it must be used.
                        //listOfEvents.events = [eventName.text,]
                      },
                      child: Text('Speichern'),
                    )
                  ],
                ),
              ),
            ],
          )));
}
