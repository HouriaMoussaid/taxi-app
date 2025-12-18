import 'simple_map.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

Future<void> main() async {
  await Geolocator.requestPermission();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaxiApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SimpleMapPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
