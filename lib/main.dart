import 'dart:async';

import 'package:flutter/material.dart';

import 'map.dart';
import 'pip.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  bool isPip = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      setState(() {
        isPip = false;
      });
    } else if (state == AppLifecycleState.inactive) {
      setState(() {
        isPip = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isPip
        ? PipMode()
        : Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: MyMap(isPip),
          );
  }
}
