import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:taxi_app/widgets/button.dart';
import '../widgets/app_drawer.dart';
import '../Views/request_ride.dart';

class SimpleMapPage extends StatefulWidget {
  @override
  _SimpleMapPageState createState() => _SimpleMapPageState();
}

class _SimpleMapPageState extends State<SimpleMapPage> {
  LatLng _center = const LatLng(33.5731, -7.5898);
  late GoogleMapController _mapController;
  bool _isRequestOpen = false;
  bool _isLocationLoaded = false;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return;

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) return;
      }

      if (permission == LocationPermission.deniedForever) return;

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _center = LatLng(position.latitude, position.longitude);
        _isLocationLoaded = true;
      });
    } catch (e) {
      print("Location error: $e");
    }
  }

  void _showRequestRideModal(BuildContext context) {
    setState(() {
      _isRequestOpen = true;
    });

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return RequestRidePage(parentContext: context);
      },
    ).then((_) {
      setState(() {
        _isRequestOpen = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: Builder(
        builder: (BuildContext scaffoldContext) {
          return Stack(
            children: [
              // Carte Google Maps
              _isLocationLoaded
                  ? GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 14.0,
                      ),
                      markers: {
                        Marker(
                          markerId: const MarkerId('current_location'),
                          position: _center,
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueOrange),
                          infoWindow: const InfoWindow(
                            title: 'Votre position',
                            snippet: 'Casablanca',
                          ),
                        ),
                      },
                      onMapCreated: (controller) {
                        _mapController = controller;
                      },
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      zoomControlsEnabled: false,
                      mapType: MapType.normal,
                      buildingsEnabled: true,
                      compassEnabled: true,
                      indoorViewEnabled: true,
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                          SizedBox(height: 20),
                          Text('Récupération de la localisation...'),
                        ],
                      ),
                    ),

              // Gradient overlay en haut
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              // Bouton menu pour drawer
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
                  child: const Icon(Icons.menu, color: Colors.white),
                ),
              ),

              // Bouton principal Réserver un transport
              Positioned(
                bottom: 100,
                left: 0,
                right: 0,
                child: Center(
                  child: ButtonWidget(
                    titre: 'Réserver un transport',
                    onPressed: () => _showRequestRideModal(context),
                    width: 220,
                    height: 50,
                    color: const Color(0xFFF67F00),
                    colorFont: Colors.white,
                  ),
                ),
              ),

              // Boutons de contrôle latéraux
              Positioned(
                right: 20,
                bottom: 180,
                child: Column(
                  children: [
                    _buildMapControlButton(
                      icon: Icons.my_location,
                      onPressed: () {
                        _mapController.animateCamera(
                          CameraUpdate.newLatLng(_center),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildMapControlButton(
                      icon: Icons.add,
                      onPressed: () {
                        _mapController.animateCamera(CameraUpdate.zoomIn());
                      },
                    ),
                    const SizedBox(height: 5),
                    _buildMapControlButton(
                      icon: Icons.remove,
                      onPressed: () {
                        _mapController.animateCamera(CameraUpdate.zoomOut());
                      },
                    ),
                    const SizedBox(height: 10),
                    _buildMapControlButton(
                      icon: Icons.layers,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildMapControlButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: const Color(0xFFF67F00),
        ),
        style: IconButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(12),
        ),
      ),
    );
  }
}
