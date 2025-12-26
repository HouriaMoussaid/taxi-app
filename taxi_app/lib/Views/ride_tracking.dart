import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'finish_ride_page.dart';

class RideTrackingPage extends StatefulWidget {
  final LatLng startLocation;
  final LatLng endLocation;
  final String destinationName;
  final String driverName;
  final String carName;

  const RideTrackingPage({
    Key? key,
    required this.startLocation,
    required this.endLocation,
    required this.destinationName,
    required this.driverName,
    required this.carName,
  }) : super(key: key);

  @override
  State<RideTrackingPage> createState() => _RideTrackingPageState();
}

class _RideTrackingPageState extends State<RideTrackingPage> {
  GoogleMapController? _mapController;

  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};

  Timer? _timer;
  LatLng _driverPosition = const LatLng(0, 0);

  bool _driverArrived = false;
  bool _rideStarted = false;
  double _progress = 0.0;

  late Map<String, dynamic> _driver;

  @override
  void initState() {
    super.initState();

    _driver = {
      'name': widget.driverName,
      'car': widget.carName,
      'rating': 4.8,
      'plate': 'CAS-1234',
    };

    _driverPosition = LatLng(
      widget.startLocation.latitude - 0.01,
      widget.startLocation.longitude - 0.01,
    );

    _initMap();
    _simulateDriverToClient();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // ---------------- MAP INIT ----------------

  void _initMap() {
    _markers.addAll([
      Marker(
        markerId: const MarkerId("start"),
        position: widget.startLocation,
        infoWindow: const InfoWindow(title: "Départ"),
      ),
      Marker(
        markerId: const MarkerId("end"),
        position: widget.endLocation,
        infoWindow: InfoWindow(title: widget.destinationName),
      ),
      Marker(
        markerId: const MarkerId("driver"),
        position: _driverPosition,
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        ),
        infoWindow: InfoWindow(title: _driver["name"]),
      ),
    ]);

    _polylines.add(
      Polyline(
        polylineId: const PolylineId("route"),
        points: [widget.startLocation, widget.endLocation],
        color: const Color(0xFFF67F00),
        width: 5,
      ),
    );
  }

  // ---------------- DRIVER → CLIENT ----------------

  void _simulateDriverToClient() {
    _timer = Timer.periodic(const Duration(milliseconds: 700), (timer) {
      setState(() {
        _progress += 0.04;

        _driverPosition = LatLng(
          _lerp(_driverPosition.latitude, widget.startLocation.latitude, 0.15),
          _lerp(_driverPosition.longitude, widget.startLocation.longitude, 0.15),
        );

        _updateDriverMarker();

        if (_progress >= 1) {
          timer.cancel();
          _driverArrived = true;
          _showDriverArrivedDialog();
        }
      });
    });
  }

  // ---------------- CLIENT → DESTINATION ----------------

  void _startRide() {
    _progress = 0;
    _rideStarted = true;

    _timer = Timer.periodic(const Duration(milliseconds: 700), (timer) {
      setState(() {
        _progress += 0.02;

        _driverPosition = LatLng(
          _lerp(_driverPosition.latitude, widget.endLocation.latitude, 0.08),
          _lerp(_driverPosition.longitude, widget.endLocation.longitude, 0.08),
        );

        _updateDriverMarker();

        if (_progress >= 1) {
          timer.cancel();
          _finishRide();
        }
      });
    });
  }

  // ---------------- FINISH ----------------

  void _finishRide() {
    final distance = _calculateDistance(
      widget.startLocation,
      widget.endLocation,
    );

    final duration = (distance / 40 * 60).round();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => FinishRidePage(
          driver: _driver,
          distance: distance,
          duration: duration,
          startLocation: widget.startLocation,
          endLocation: widget.endLocation,
        ),
      ),
    );
  }

  // ---------------- HELPERS ----------------

  void _updateDriverMarker() {
    _markers.removeWhere((m) => m.markerId.value == "driver");
    _markers.add(
      Marker(
        markerId: const MarkerId("driver"),
        position: _driverPosition,
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        ),
        infoWindow: InfoWindow(title: _driver["name"]),
      ),
    );
  }

  double _lerp(double a, double b, double t) {
    return a + (b - a) * t;
  }

  double _calculateDistance(LatLng a, LatLng b) {
    final dx = (a.latitude - b.latitude).abs();
    final dy = (a.longitude - b.longitude).abs();
    return (dx + dy) * 111;
  }

  // ---------------- DIALOG ----------------

  void _showDriverArrivedDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text("🚗 Chauffeur arrivé"),
        content: Text("${_driver['name']} est arrivé."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _startRide();
            },
            child: const Text("Monter dans le taxi"),
          ),
        ],
      ),
    );
  }

  // ---------------- UI ----------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_rideStarted ? "Course en cours" : "Chauffeur en route"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: widget.startLocation,
              zoom: 14,
            ),
            markers: _markers,
            polylines: _polylines,
            onMapCreated: (c) => _mapController = c,
            myLocationEnabled: false,
            zoomControlsEnabled: false,
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 15),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LinearProgressIndicator(
                    value: _progress,
                    color: const Color(0xFFF67F00),
                    backgroundColor: Colors.grey[300],
                    minHeight: 6,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    _rideStarted
                        ? "En route vers ${widget.destinationName}"
                        : "Le chauffeur arrive...",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${_driver['name']} • ${_driver['car']} • ${_driver['plate']}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
