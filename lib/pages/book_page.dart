import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: TabBar(tabs: [
            Tab(
                child: Column(
              children: [Icon(Icons.directions_car), Text('car')],
            )),
            Tab(
              child: Column(
                  children: [Icon(Icons.directions_transit), Text('transit')]),
            ),
            Tab(
                child: Column(
              children: [Icon(Icons.directions_bike), Text('bike')],
            ))
          ]),
        ),
        body: TabBarView(children: [
          Icon(Icons.directions_car),
          Icon(Icons.directions_transit),
          Icon(Icons.directions_bike)
        ]),
      ),
    );
  }
}
