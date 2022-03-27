import 'package:flutter/material.dart';

import '../../main.dart';

class Forum extends StatefulWidget {
  const Forum({Key? key}) : super(key: key);

  @override
  State<Forum> createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forum"),
      ),
      body: Column(
        children: <Widget>[
          ForumFolder(
            iconData: Icons.account_balance_outlined,
            title: "Aufenthalt",
          ),
          ForumFolder(
            iconData: Icons.account_box_outlined,
            title: "Jobbörse",
          ),
          ForumFolder(
            iconData: Icons.alternate_email,
            title: "Allgemein",
          )
        ],
      ),
    );
  }
}

class ForumFolder extends StatefulWidget {
  ForumFolder({
    Key? key,
    required this.iconData,
    required this.title,
  }) : super(key: key);

  IconData iconData;
  String title;

  @override
  State<ForumFolder> createState() => _ForumFolderState();
}

class _ForumFolderState extends State<ForumFolder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 5, 10, 5),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                );
              },
              child: Row(
                children: [
                  Icon(
                    widget.iconData,
                    color: Colors.black,
                  ),
                  Text(
                    " " + widget.title,
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
