import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfilePage createState() => _ProfilePage();
}

/*
profile Page
 */

class _ProfilePage extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konto'),
        actions: <Widget>[
          IconButton(onPressed: null, icon: Icon(Icons.settings))
        ],
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.brown, shape: BoxShape.rectangle),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    "Example Username",
                    maxLines: 2,
                    textScaleFactor: 2,
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
          Container(
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(color: Colors.brown, shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.brown,
                  backgroundImage:
                      AssetImage('assets/defaultProfilePicture.png'),
                ),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileEntry(
                    category: "Name", description: "A very long example Name"),
                ProfileEntry(category: "Age", description: "123"),
                ProfileEntry(category: "Birthday", description: "30.02.")
              ],
            ),
          )
        ],
      ),

      //const Center(child: Text("Diese Seite wurde noch nicht entwickelt!!!")),
    );
  }
}

class ProfileEntry extends StatefulWidget {
  var category;
  var description;

  ProfileEntry({Key? key, required this.category, required this.description})
      : super(key: key);

  @override
  _ProfileEntryState createState() => _ProfileEntryState();
}

class _ProfileEntryState extends State<ProfileEntry> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 70, 5),
          child: Text(
            widget.category,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
          child: Text(widget.description, textAlign: TextAlign.center),
        )
      ],
    );
  }
}
