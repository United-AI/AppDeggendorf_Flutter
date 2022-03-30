import 'package:flutter/material.dart';

import '../../main.dart';

/*
profile Page
 */
class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
      body: const Center(
          child: Text("Diese Seite wurde noch nicht entwickelt!!!")),
    );
  }
}
