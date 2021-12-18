import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class FullScreenMap extends StatefulWidget {
  @override
  State<FullScreenMap> createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  late MapboxMapController mapController;
  final center = LatLng(-33.51116466234621, -70.60739170732393);
  String selectedStyle = 'mapbox://styles/jord1dev/ckxc1szha4veu14mtfkxqenkf';
  final darkStyle = 'mapbox://styles/jord1dev/ckxc1szha4veu14mtfkxqenkf';
  final lightStyle = 'mapbox://styles/jord1dev/ckxc1vken315t14pp02tkv6zk';

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createMap(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.zoom_in),
            onPressed: () {
              mapController.animateCamera(CameraUpdate.zoomIn());
            },
          ),
          SizedBox(height: 5),
          FloatingActionButton(
            child: Icon(Icons.zoom_out),
            onPressed: () {
              mapController.animateCamera(CameraUpdate.zoomOut());
            },
          ),
          SizedBox(height: 5),
          FloatingActionButton(
            child: Icon(Icons.dark_mode),
            onPressed: () {
              if (selectedStyle == darkStyle)
                selectedStyle = lightStyle;
              else
                selectedStyle = darkStyle;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  MapboxMap createMap() {
    return MapboxMap(
      styleString: selectedStyle,
      onMapCreated: _onMapCreated,
      accessToken:
          "sk.eyJ1Ijoiam9yZDFkZXYiLCJhIjoiY2t4YnpvZ2cxNGFyYTJ1cW83ZnRvN3hkOCJ9.M31CkMhz63RewDSTGPhw2Q",
      initialCameraPosition: CameraPosition(
        target: center,
        zoom: 14,
      ),
    );
  }
}
