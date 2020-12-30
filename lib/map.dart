import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  MyMap(bool isPipMode) : _isPipMode = isPipMode;

  final bool _isPipMode;
  @override
  MapState createState() => MapState();
}

class MapState extends State<MyMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(-33.506621947757104, -70.60583903121949),
    zoom: 15,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    GoogleMapController controller = await _controller.future;
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(
        onPointerDown: (e) {},
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _initialPosition,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          minMaxZoomPreference: MinMaxZoomPreference(10, 20),
          zoomControlsEnabled: widget._isPipMode ? false : true,
        ),
      ),
    );
  }
}
