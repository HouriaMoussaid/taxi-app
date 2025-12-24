import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/Views/ride_tracking_page.dart';

class RequestRidePage extends StatefulWidget {
  const RequestRidePage({Key? key}) : super(key: key);

  @override
  State<RequestRidePage> createState() => _RequestRidePageState();
}

class _RequestRidePageState extends State<RequestRidePage> {
  TextEditingController _destinationController = TextEditingController();
  LatLng? _selectedDestination;
  Set<Marker> _markers = {};
  LatLng _userLocation = LatLng(33.5731, -7.5898); // Position par défaut

  // Simuler des suggestions de destinations
  final List<Map<String, dynamic>> _suggestions = [
    {'name': 'Gare Casa-Voyageurs', 'lat': 33.5894, 'lng': -7.5905},
    {'name': 'ENIAD', 'lat': 33.5720, 'lng': -7.5850},
    {'name': 'Marjane Maarif', 'lat': 33.5790, 'lng': -7.6000},
    {'name': 'Aéroport Mohammed V', 'lat': 33.5563, 'lng': -7.6666},
  ];

  void _selectDestination(Map<String, dynamic> place) {
    setState(() {
      _destinationController.text = place['name'];
      _selectedDestination = LatLng(place['lat'], place['lng']);

      // Ajouter un marqueur
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId('destination'),
          position: _selectedDestination!,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          infoWindow: InfoWindow(title: place['name']),
        ),
      );
    });
  }

  void _requestRide() {
    if (_selectedDestination != null) {
      Navigator.pop(context); // Fermer le modal
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RideTrackingPage(
            startLocation: _userLocation,
            endLocation: _selectedDestination!,
            destinationName: _destinationController.text,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Veuillez sélectionner une destination'),
          backgroundColor: Color(0xFFFF6B35),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          // Poignée
          Container(
            margin: EdgeInsets.only(top: 12, bottom: 8),
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Titre
                Text(
                  'Où allez-vous ?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 20),

                // Champ de recherche de destination
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),  // Gris 50
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: const Color(0xFFEEEEEE)),  // Gris 200
                  ),
                  child: TextField(
                    controller: _destinationController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Color(0xFFFF6B35)),
                      hintText: 'Entrez votre destination',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Suggestions rapides
                Text(
                  'Destinations populaires',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 12),

                // Liste des suggestions
                Column(
                  children: _suggestions.map((place) {
                    return ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF6B35).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.location_on,
                          color: Color(0xFFFF6B35),
                          size: 20,
                        ),
                      ),
                      title: Text(
                        place['name'],
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey[400],
                      ),
                      onTap: () => _selectDestination(place),
                      contentPadding: EdgeInsets.symmetric(vertical: 4),
                    );
                  }).toList(),
                ),

                // Bouton de confirmation
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _requestRide,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF6B35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 18),
                    ),
                    child: Text(
                      'Chercher un chauffeur',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}