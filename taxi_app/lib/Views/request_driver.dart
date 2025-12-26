import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

import '../database/driver_database.dart';
import '../models/driver_model.dart';
import '../widgets/bottom_sheet_drivers.dart';
import 'ride_tracking.dart';

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
  LatLng _center = const LatLng(33.5731, -7.5898);

  LatLng? departureLatLng;
  LatLng? destinationLatLng;

  @override
  void initState() {
    super.initState();
    _insertDriversIfEmpty(); // ✅ SQLite init
    _setMarkers();
  }

  Future<void> _insertDriversIfEmpty() async {
    final db = DriverDatabase.instance;
    final drivers = await db.getAllDrivers();
    if (drivers.isNotEmpty) return;

    await db.insertDriver(
        Driver(name: "Ahmed", car: "Clio", distance: "2 km", eta: "5 min"));
    await db.insertDriver(
        Driver(name: "Sofia", car: "Logan", distance: "3 km", eta: "7 min"));
    await db.insertDriver(
        Driver(name: "Moussa", car: "Peugeot", distance: "1.5 km", eta: "4 min"));
    await db.insertDriver(
        Driver(name: "Houria", car: "Renault", distance: "2.5 km", eta: "6 min"));
  }

  Future<LatLng> _getCoordinates(String address) async {
    try {
      final locations = await locationFromAddress(address);
      return LatLng(locations.first.latitude, locations.first.longitude);
    } catch (_) {
      return _center;
    }
  }

  Future<void> _setMarkers() async {
    departureLatLng = await _getCoordinates(widget.departure);
    destinationLatLng = await _getCoordinates(widget.destination);

    setState(() {
      _markers
        ..clear()
        ..add(
          Marker(
            markerId: const MarkerId('departure'),
            position: departureLatLng!,
            infoWindow: InfoWindow(title: "Départ"),
          ),
        )
        ..add(
          Marker(
            markerId: const MarkerId('destination'),
            position: destinationLatLng!,
            infoWindow: InfoWindow(title: "Destination"),
          ),
        );
      _center = departureLatLng!;
    });

    final controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(
            min(departureLatLng!.latitude, destinationLatLng!.latitude),
            min(departureLatLng!.longitude, destinationLatLng!.longitude),
          ),
          northeast: LatLng(
            max(departureLatLng!.latitude, destinationLatLng!.latitude),
            max(departureLatLng!.longitude, destinationLatLng!.longitude),
          ),
        ),
        100,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: _center, zoom: 14),
            onMapCreated: (c) => _controller.complete(c),
            markers: _markers,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
          ),

          /// 🔽 Bottom Sheet Drivers (SQLite)
          Align(
            alignment: Alignment.bottomCenter,
            child: DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.2,
              maxChildSize: 0.85,
              builder: (_, scrollController) {
                return BottomPanelDriver(
                  scrollController: scrollController,
                  onDriverSelected: (driver) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RideTrackingPage(
                          startLocation: departureLatLng!,
                          endLocation: destinationLatLng!,
                          destinationName: widget.destination,
                          driverName: driver.name,
                          carName: driver.car,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
