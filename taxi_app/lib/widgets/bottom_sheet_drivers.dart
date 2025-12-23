import 'package:flutter/material.dart';
import 'package:taxi_app/widgets/button.dart';
import 'driver_card.dart';

class BottomPanelDriver extends StatelessWidget {
  const BottomPanelDriver({super.key, required this.scrollController});

  final ScrollController scrollController;

  static const List<Map<String, String>> drivers = [
    {"name": "Ahmed", "car": "Clio", "distance": "2 km", "eta": "5 min"},
    {"name": "Sofia", "car": "Logan", "distance": "3 km", "eta": "7 min"},
    {"name": "Moussa", "car": "Peugeot", "distance": "1.5 km", "eta": "4 min"},
    {"name": "Houria", "car": "Renault", "distance": "2.5 km", "eta": "6 min"},
    {"name": "Youssef", "car": "Dacia", "distance": "4 km", "eta": "10 min"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, -3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // 👆 POIGNÉE (drag handle)
          Container(
            width: 40,
            height: 5,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const Text(
            "Chauffeurs disponibles",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          // 🔽 LISTE (connectée au scrollController)
          Expanded(
            child: ListView.builder(
              controller: scrollController, // 🔥 OBLIGATOIRE
              itemCount: drivers.length,
              itemBuilder: (context, index) {
                final driver = drivers[index];
                return DriverCard(
                  driverName: driver["name"]!,
                  carType: driver["car"]!,
                  distance: driver["distance"]!,
                  eta: driver["eta"]!,
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: ButtonWidget(
                  titre: "Choisir",
                  onPressed: () {},
                  color: const Color(0xFFF67F00),
                  colorFont: Colors.white,
                  width: double.infinity,
                  height: 50,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ButtonWidget(
                  titre: "Annuler",
                  onPressed: () {},
                  color: Colors.white,
                  colorFont: const Color(0xFFF67F00),
                  width: double.infinity,
                  height: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
