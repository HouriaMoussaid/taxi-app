import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import '../widgets/bottom_sheet_drivers.dart';

class RequestDriver extends StatefulWidget {
  final String departure;
  final String destination;

  const RequestDriver({
    super.key,
    required this.departure,
    required this.destination,
  });

  @override
  State<RequestDriver> createState() => _RequestDriverState();
}

class _RequestDriverState extends State<RequestDriver> {
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  LatLng _center = const LatLng(33.5731, -7.5898); // fallback

  @override
  void initState() {
    super.initState();
    _setMarkers();
  }

  /// Transforme une adresse en coordonnées LatLng
  Future<LatLng> _getCoordinates(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        return LatLng(locations.first.latitude, locations.first.longitude);
      }
    } catch (e) {
      print("Erreur géocodage pour $address : $e");
    }
    return _center; // fallback
  }

  /// Place les markers sur la carte
  Future<void> _setMarkers() async {
    LatLng departureLatLng = await _getCoordinates(widget.departure);
    LatLng destinationLatLng = await _getCoordinates(widget.destination);

    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: const MarkerId('departure'),
          position: departureLatLng,
          infoWindow: InfoWindow(title: 'Départ', snippet: widget.departure),
        ),
      );
      _markers.add(
        Marker(
          markerId: const MarkerId('destination'),
          position: destinationLatLng,
          infoWindow: InfoWindow(title: 'Destination', snippet: widget.destination),
        ),
      );

      _center = departureLatLng;
    });

    final GoogleMapController controller = await _controller.future;
    LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(
        min(departureLatLng.latitude, destinationLatLng.latitude),
        min(departureLatLng.longitude, destinationLatLng.longitude),
      ),
      northeast: LatLng(
        max(departureLatLng.latitude, destinationLatLng.latitude),
        max(departureLatLng.longitude, destinationLatLng.longitude),
      ),
    );

    controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 100));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Carte Google Maps
          GoogleMap(
            initialCameraPosition: CameraPosition(target: _center, zoom: 14),
            onMapCreated: (controller) {
              _controller.complete(controller);
            },
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
          ),

          // Conteneurs pour départ et destination en haut
          Positioned(
            top: 40,
            left: 10,
            right: 10,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black26)],
                  ),
                  child: Row(
                    children: [
                      const Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(Icons.circle_outlined, size: 24, color: Color(0xFFF67F00)),
                          Icon(Icons.circle_sharp, size: 10, color: Color(0xFFF67F00)),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Expanded(child: Text(widget.departure)),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black26)],
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on, color: Color(0xFFF67F00)),
                      const SizedBox(width: 10),
                      Expanded(child: Text(widget.destination)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom sheet des chauffeurs
          Align(
            alignment: Alignment.bottomCenter,
            child: DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.40,
              minChildSize: 0.20,
              maxChildSize: 0.85,
              builder: (context, scrollController) {
                return BottomPanelDriver(scrollController: scrollController);
              },
            ),
          ),
        ],
      ),
    );
  }
}
