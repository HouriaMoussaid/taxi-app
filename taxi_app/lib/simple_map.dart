import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/Views/request_ride.dart';
class SimpleMapPage extends StatefulWidget {
  @override
  _SimpleMapPageState createState() => _SimpleMapPageState();
}

class _SimpleMapPageState extends State<SimpleMapPage> {
  LatLng _center = LatLng(33.5731, -7.5898); // Default: Casablanca

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TaxiApp - Simple Map'),
      ),
      body:
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 12.0,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('test'),
                  position: _center,
                ),
              },
            ),


    );
  }
}

