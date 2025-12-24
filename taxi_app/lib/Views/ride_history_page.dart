import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RideHistoryPage extends StatefulWidget {
  @override
  State<RideHistoryPage> createState() => _RideHistoryPageState();
}

class _RideHistoryPageState extends State<RideHistoryPage> {
  // Données simulées d'historique
  final List<Map<String, dynamic>> _rides = [
    {
      'id': 1,
      'driverName': 'Ahmed',
      'date': DateTime.now().subtract(Duration(days: 1)),
      'distance': 8.5,
      'duration': 18,
      'price': 51.0,
      'start': 'Casa-Port',
      'end': 'Marjane Maarif',
      'rating': 4.5,
    },
    {
      'id': 2,
      'driverName': 'Karim',
      'date': DateTime.now().subtract(Duration(days: 3)),
      'distance': 12.2,
      'duration': 25,
      'price': 73.2,
      'start': 'Gare Casa-Voyageurs',
      'end': 'Aéroport Mohammed V',
      'rating': 5.0,
    },
    {
      'id': 3,
      'driverName': 'Fatima',
      'date': DateTime.now().subtract(Duration(days: 7)),
      'distance': 5.3,
      'duration': 12,
      'price': 31.8,
      'start': 'ENIAD',
      'end': 'Anfaplace',
      'rating': 4.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Historique des courses',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFFF6B35)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _rides.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.history,
              size: 80,
              color: Colors.grey[300],
            ),
            SizedBox(height: 20),
            Text(
              'Aucune course historique',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      )
          : ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: _rides.length,
        itemBuilder: (context, index) {
          final ride = _rides[index];
          return _buildRideCard(ride);
        },
      ),
    );
  }

  Widget _buildRideCard(Map<String, dynamic> ride) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header avec date et prix
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('dd MMM yyyy • HH:mm').format(ride['date']),
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Color(0xFFFF6B35).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${ride['price'].toStringAsFixed(1)} DH',
                    style: TextStyle(
                      color: Color(0xFFFF6B35),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),

            // Points de départ et d'arrivée
            _buildLocationRow(
              icon: Icons.location_on,
              color: Colors.green,
              title: 'Départ',
              address: ride['start'],
            ),
            SizedBox(height: 12),
            _buildLocationRow(
              icon: Icons.flag,
              color: Colors.red,
              title: 'Arrivée',
              address: ride['end'],
            ),

            SizedBox(height: 15),

            // Détails de la course
            Row(
              children: [
                _buildDetailItem(
                  icon: Icons.linear_scale,
                  value: '${ride['distance']} km',
                  label: 'Distance',
                ),
                SizedBox(width: 20),
                _buildDetailItem(
                  icon: Icons.timer,
                  value: '${ride['duration']} min',
                  label: 'Durée',
                ),
                SizedBox(width: 20),
                _buildDetailItem(
                  icon: Icons.person,
                  value: ride['driverName'],
                  label: 'Chauffeur',
                ),
              ],
            ),

            SizedBox(height: 15),

            // Évaluation et actions
            Divider(color: Colors.grey[200]),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 18),
                    SizedBox(width: 5),
                    Text(
                      '${ride['rating']}',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Action de refaire la course
                      },
                      icon: Icon(Icons.replay, color: Color(0xFFFF6B35)),
                      tooltip: 'Refaire ce trajet',
                    ),
                    IconButton(
                      onPressed: () {
                        // Action de signaler un problème
                      },
                      icon: Icon(Icons.report_problem, color: Colors.grey[500]),
                      tooltip: 'Signaler un problème',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationRow({
    required IconData icon,
    required Color color,
    required String title,
    required String address,
  }) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 18),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 2),
              Text(
                address,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: Colors.grey[600]),
              SizedBox(width: 5),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}