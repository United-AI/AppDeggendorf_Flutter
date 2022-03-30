import 'package:deggendorf_app/bottom_navigation_bar_buttons/home_page/home_page.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation_bar_buttons/forum/forum.dart';
import 'bottom_navigation_bar_buttons/profile/profile.dart';
import 'bottom_navigation_bar_buttons/profile/profile.dart';
import 'bottom_navigation_bar_buttons/home_page/weather/current_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deggendorf App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'DeggApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  /*
  Here is the list where the widgets for the bottom navigation bar are
  The list starts at index zero
  An exception has yet to be implemented which will be triggered whenever there
  is not enough widget for the number of buttons
   */
  static const List<Widget> _widgetOptions = <Widget>[
    //Index: 0
    HomePage(),
    //Index: 1,
    SecondRoute(),
    //Index: 2,
    Forum(),
    //Index: 3
    Profile(),
    //Index: 4
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      Here is where the magic takes place :)
      Each of the navigation bar item has an index starting from 0
      This index is used to refer to a list and call widgets
       */
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      /*
      From here are the bottom navigation bar's buttons
      Each button has an icon, a label and a colour, each of which are optional
       */
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alternate_email),
            label: 'Event',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_sharp),
            label: 'Forum',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Konto',
            backgroundColor: Colors.brown,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

/*
This is a default route shown wherever a page is not developed yet
 */
class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: const Center(
          child: Text("Diese Seite wurde noch nicht entwickelt!!!")),
    );
  }
}
