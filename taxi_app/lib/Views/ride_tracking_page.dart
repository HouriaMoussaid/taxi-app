import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/Views/finish_ride_page.dart';

class RideTrackingPage extends StatefulWidget {
  final LatLng startLocation;
  final LatLng endLocation;
  final String destinationName;

  const RideTrackingPage({
    Key? key,
    required this.startLocation,
    required this.endLocation,
    required this.destinationName,
  }) : super(key: key);

  @override
  State<RideTrackingPage> createState() => _RideTrackingPageState();
}

class _RideTrackingPageState extends State<RideTrackingPage> {
  late GoogleMapController _mapController;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  Timer? _driverTimer;
  LatLng _driverPosition = LatLng(33.5800, -7.6000); // Position initiale du chauffeur
  bool _driverArrived = false;
  bool _rideStarted = false;
  int _estimatedTime = 5; // minutes
  double _progress = 0.0;

  // Simulation d'un chauffeur
  final Map<String, dynamic> _driver = {
    'name': 'Mohamed',
    'car': 'Peugeot 208',
    'rating': 4.8,
    'plate': 'CAS-1234',
  };

  @override
  void initState() {
    super.initState();
    _initializeMap();
    _simulateDriverMovement();
  }

  @override
  void dispose() {
    _driverTimer?.cancel();
    super.dispose();
  }

  void _initializeMap() {
    _markers.addAll({
      Marker(
        markerId: MarkerId('start'),
        position: widget.startLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: InfoWindow(title: 'Départ'),
      ),
      Marker(
        markerId: MarkerId('end'),
        position: widget.endLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow: InfoWindow(title: widget.destinationName),
      ),
      Marker(
        markerId: MarkerId('driver'),
        position: _driverPosition,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        infoWindow: InfoWindow(title: 'Chauffeur ${_driver['name']}'),
      ),
    });

    _polylines.add(
      Polyline(
        polylineId: PolylineId('route'),
        color: Color(0xFFFF6B35),
        width: 4,
        points: [widget.startLocation, widget.endLocation],
      ),
    );
  }

  void _simulateDriverMovement() {
    _driverTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (!_driverArrived) {
        // Simulation du mouvement vers l'utilisateur
        double latStep = (widget.startLocation.latitude - _driverPosition.latitude) / 50;
        double lngStep = (widget.startLocation.longitude - _driverPosition.longitude) / 50;

        setState(() {
          _driverPosition = LatLng(
            _driverPosition.latitude + latStep,
            _driverPosition.longitude + lngStep,
          );

          // Mettre à jour le marqueur du chauffeur
          _markers.removeWhere((marker) => marker.markerId.value == 'driver');
          _markers.add(
            Marker(
              markerId: MarkerId('driver'),
              position: _driverPosition,
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
              rotation: 45.0,
            ),
          );

          // Vérifier si le chauffeur est arrivé
          double distance = _calculateDistance(
            _driverPosition.latitude,
            _driverPosition.longitude,
            widget.startLocation.latitude,
            widget.startLocation.longitude,
          );

          if (distance < 0.001 && !_driverArrived) { // ~100m
            _driverArrived = true;
            _showDriverArrivedDialog();
          }

          // Mettre à jour la progression
          if (!_rideStarted) {
            _progress = 1.0 - (distance / _calculateDistance(
              _driverPosition.latitude,
              _driverPosition.longitude,
              widget.startLocation.latitude,
              widget.startLocation.longitude,
            ));
          }
        });
      }
    });
  }

  double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    // Calcul simplifié de distance
    return ((lat1 - lat2).abs() + (lon1 - lon2).abs());
  }

  void _showDriverArrivedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xFFFF6B35).withOpacity(0.1),
              child: Icon(
                Icons.directions_car_filled,
                size: 50,
                color: Color(0xFFFF6B35),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Votre chauffeur est arrivé !',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${_driver['name']} avec ${_driver['car']}',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                SizedBox(width: 5),
                Text('${_driver['rating']}'),
                SizedBox(width: 20),
                Icon(Icons.confirmation_number, color: Colors.grey, size: 20),
                SizedBox(width: 5),
                Text('${_driver['plate']}'),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _startRide();
            },
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFFF6B35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text(
              'Monter dans le taxi',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _startRide() {
    setState(() {
      _rideStarted = true;
      _progress = 0.0;
    });

    // Simuler le trajet vers la destination
    _simulateRideToDestination();
  }

  void _simulateRideToDestination() {
    // Réinitialiser le timer pour le trajet
    _driverTimer?.cancel();
    _driverTimer = Timer.periodic(Duration(milliseconds: 800), (timer) {
      double latStep = (widget.endLocation.latitude - _driverPosition.latitude) / 100;
      double lngStep = (widget.endLocation.longitude - _driverPosition.longitude) / 100;

      setState(() {
        _driverPosition = LatLng(
          _driverPosition.latitude + latStep,
          _driverPosition.longitude + lngStep,
        );

        // Mettre à jour la progression
        double totalDistance = _calculateDistance(
          widget.startLocation.latitude,
          widget.startLocation.longitude,
          widget.endLocation.latitude,
          widget.endLocation.longitude,
        );

        double currentDistance = _calculateDistance(
          _driverPosition.latitude,
          _driverPosition.longitude,
          widget.startLocation.latitude,
          widget.startLocation.longitude,
        );

        _progress = currentDistance / totalDistance;
        _estimatedTime = (5 * (1 - _progress)).ceil();

        // Vérifier si destination atteinte
        if (_progress >= 0.99) {
          timer.cancel();
          _finishRide();
        }
      });
    });
  }

  void _finishRide() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => FinishRidePage(
          driver: _driver,
          distance: 12.5, // km
          duration: 25, // minutes
          startLocation: widget.startLocation,
          endLocation: widget.endLocation,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _rideStarted ? 'Course en cours' : 'Chauffeur en route',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFFF6B35)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          // Carte Google Maps
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: widget.startLocation,
              zoom: 14.0,
            ),
            markers: _markers,
            polylines: _polylines,
            onMapCreated: (controller) {
              _mapController = controller;
            },
            myLocationEnabled: false,
            zoomControlsEnabled: false,
          ),

          // Panneau d'information en bas
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 20,
                    spreadRadius: 0,
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Barre de progression
                  LinearProgressIndicator(
                    value: _progress,
                    backgroundColor: Colors.grey[200],
                    color: Color(0xFFFF6B35),
                    minHeight: 6,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _rideStarted ? 'En route vers' : 'Arrivée prévue',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            _rideStarted ? widget.destinationName : 'Votre position',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Temps restant',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '$_estimatedTime min',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFF6B35),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // Infos du chauffeur
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Color(0xFFFF6B35).withOpacity(0.1),
                          child: Icon(
                            Icons.person,
                            color: Color(0xFFFF6B35),
                            size: 30,
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _driver['name'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                _driver['car'] + ' • ' + _driver['plate'],
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 18),
                            SizedBox(width: 5),
                            Text('${_driver['rating']}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bouton d'urgence/contact
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(Icons.emergency, color: Colors.red),
                onPressed: () {
                  // Action d'urgence
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}