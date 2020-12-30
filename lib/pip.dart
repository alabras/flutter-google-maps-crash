import 'package:flutter/material.dart';
import 'package:google_maps_crash/map.dart';

class PipMode extends StatefulWidget {
  @override
  _PipModeState createState() => _PipModeState();
}

class _PipModeState extends State<PipMode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 23,
            child: MyMap(true),
          ),
        ],
      ),
    );
  }
}
