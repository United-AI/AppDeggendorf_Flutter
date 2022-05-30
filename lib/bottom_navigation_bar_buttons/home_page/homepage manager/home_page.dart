import 'package:deggendorf_app/bottom_navigation_bar_buttons/home_page/homepage%20manager/list_of_widgets_for_home_page.dart';
import 'package:deggendorf_app/bin/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deggendorf App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Option 1'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondRoute()));
              },
            ),
            ListTile(
              title: const Text('Option 2'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondRoute()));
              },
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        center: centerKey,
        slivers: <Widget>[
          SliverList(
            key: centerKey,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return new InkWell(
                  onTap: () {
                    //If the widget tapped is the weather widget, then open weather page :)
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              new MyList(context).myListToBeTappedOn[index],
                        ));
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 125,
                        child: new MyList(context).myListToBeDisplayed[index],
                      ) //Container
                      ),
                );
              },
              childCount: new MyList(context).myListToBeDisplayed.length,
            ),
          ),
        ],
      ),
    );
  }
}
