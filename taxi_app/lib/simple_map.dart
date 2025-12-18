import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../widgets/app_drawer.dart';

class SimpleMapPage extends StatefulWidget {
  @override
  _SimpleMapPageState createState() => _SimpleMapPageState();
}

class _SimpleMapPageState extends State<SimpleMapPage> {
  LatLng _center = const LatLng(33.5731, -7.5898);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: Builder( 
        builder: (BuildContext scaffoldContext) {
          return Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 12.0,
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId('test'),
                    position: _center,
                  ),
                },
              ),
              
              Positioned(
                top: 40,
                left: 15,
                child: FloatingActionButton(
                  onPressed: () {
                    Scaffold.of(scaffoldContext).openDrawer();
                  },
                  backgroundColor: Colors.transparent,
                  elevation: 0, 
                  highlightElevation: 0,
                  child: const Icon(
                    Icons.menu, 
                    color:   Colors.white),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}