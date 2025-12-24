import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:taxi_app/Views/home_page.dart';

class FinishRidePage extends StatefulWidget {
  final Map<String, dynamic> driver;
  final double distance;
  final int duration;
  final LatLng startLocation;
  final LatLng endLocation;

  const FinishRidePage({
    Key? key,
    required this.driver,
    required this.distance,
    required this.duration,
    required this.startLocation,
    required this.endLocation,
  }) : super(key: key);

  @override
  State<FinishRidePage> createState() => _FinishRidePageState();
}

class _FinishRidePageState extends State<FinishRidePage> {
  double _rating = 5.0;
  double _price = 0.0;

  @override
  void initState() {
    super.initState();
    // Calculer le prix (6 DH/km comme spécifié)
    _price = widget.distance * 6.0;
  }

  void _submitRating() {
    // Sauvegarder la course dans l'historique
    _saveRideToHistory();

    // Retour à l'accueil
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false,
    );
  }

  void _saveRideToHistory() {
    // Ici vous ajouterez la logique pour sauvegarder dans SQLite
    print('Course sauvegardée:');
    print('Chauffeur: ${widget.driver['name']}');
    print('Distance: ${widget.distance} km');
    print('Durée: ${widget.duration} min');
    print('Prix: $_price DH');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header avec succès
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFF6B35).withOpacity(0.1),
                    Colors.white,
                  ],
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Color(0xFFFF6B35).withOpacity(0.1),
                    child: Icon(
                      Icons.check_circle,
                      size: 80,
                      color: Color(0xFFFF6B35),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Course terminée !',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Merci d\'avoir choisi Wsslni',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Récapitulatif
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildDetailRow(
                            icon: Icons.location_on,
                            title: 'Distance parcourue',
                            value: '${widget.distance.toStringAsFixed(1)} km',
                            color: Color(0xFFFF6B35),
                          ),
                          SizedBox(height: 15),
                          _buildDetailRow(
                            icon: Icons.timer,
                            title: 'Durée du trajet',
                            value: '${widget.duration} min',
                            color: Colors.blue,
                          ),
                          SizedBox(height: 15),
                          _buildDetailRow(
                            icon: Icons.attach_money,
                            title: 'Prix total',
                            value: '${_price.toStringAsFixed(2)} DH',
                            color: Colors.green,
                          ),
                          SizedBox(height: 15),
                          _buildDetailRow(
                            icon: Icons.calendar_today,
                            title: 'Date',
                            value: DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now()),
                            color: Colors.purple,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30),

                    // Section d'évaluation
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Évaluez votre trajet',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Comment s\'est passé votre course avec ${widget.driver['name']} ?',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          SizedBox(height: 20),

                          // Étoiles d'évaluation
                          Center(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(5, (index) {
                                    return IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _rating = (index + 1).toDouble();
                                        });
                                      },
                                      icon: Icon(
                                        index < _rating.floor()
                                            ? Icons.star
                                            : Icons.star_border,
                                        size: 40,
                                        color: Colors.amber,
                                      ),
                                    );
                                  }),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  _rating == 1
                                      ? 'Mauvais'
                                      : _rating == 2
                                      ? 'Passable'
                                      : _rating == 3
                                      ? 'Bien'
                                      : _rating == 4
                                      ? 'Très bien'
                                      : 'Excellent',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),

                          // Champ de commentaire
                          TextField(
                            maxLines: 3,
                            decoration: InputDecoration(
                              hintText: 'Ajouter un commentaire (optionnel)',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey[300]!),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Color(0xFFFF6B35)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 40),

                    // Boutons d'action
                    Column(
                      children: [
                        // Bouton principal
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _submitRating,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFF6B35),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 18),
                            ),
                            child: Text(
                              'Terminer et noter',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 15),

                        // Bouton secondaire
                        TextButton(
                          onPressed: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                                (route) => false,
                          ),
                          child: Text(
                            'Retour à l\'accueil',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 22),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}