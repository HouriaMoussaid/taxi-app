import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/widgets/bottom_sheet_simple.dart';

class Test2 extends StatefulWidget {
  const Test2({super.key});

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  late GoogleMapController _mapController;

  final LatLng _center = const LatLng(33.5731, -7.5898); // Casablanca

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🗺️ Carte Google Maps
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14,
            ),
            onMapCreated: (controller) {
              _mapController = controller;
            },
            markers: {
              Marker(
                markerId: const MarkerId('position'),
                position: _center,
                infoWindow: const InfoWindow(
                  title: 'Votre position',
                ),
              ),
            },
            myLocationEnabled: true,
            zoomControlsEnabled: false,
          ),

          // 🧾 Texte en haut
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "2 min restant",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // ⬇️ BottomPanel flottant
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomPanel(
              texte: 'Chauffeur en route !',
            ),
          ),
        ],
      ),
    );
  }
}
