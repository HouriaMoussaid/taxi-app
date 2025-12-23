import 'package:flutter/material.dart';

class DriverCard extends StatelessWidget {
  final String driverName;
  final String carType;
  final String distance;
  final String eta;

  const DriverCard({
    required this.driverName,
    required this.carType,
    required this.distance,
    required this.eta,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20), // augmente l'espace intérieur
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8), // plus d'espace autour
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15), // ombre douce
            blurRadius: 12,
            offset: const Offset(0, 4), // décalage vertical
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28, // plus grand
            child: Text(driverName[0], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(driverName,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 4),
                Text(carType, style: const TextStyle(fontSize: 16, color: Colors.grey)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(distance, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              Text(eta, style: const TextStyle(fontSize: 16, color: Colors.grey)),
            ],
          )
        ],
      ),
    );
  }
}
