import 'package:flutter/material.dart';
import 'package:mapbox/src/views/fullscreenmap.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MapBox App',
      home: FullScreenMap(),
      debugShowCheckedModeBanner: false,
    );
  }
}
