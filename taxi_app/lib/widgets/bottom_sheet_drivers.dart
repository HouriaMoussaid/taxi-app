import 'package:flutter/material.dart';
import 'package:taxi_app/widgets/button.dart';
import 'driver_card.dart';
import '../Views/test2.dart';

class BottomPanelDriver extends StatefulWidget {
  const BottomPanelDriver({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<BottomPanelDriver> createState() => _BottomPanelDriverState();
}

class _BottomPanelDriverState extends State<BottomPanelDriver> {
  static const List<Map<String, String>> drivers = [
    {"name": "Ahmed", "car": "Clio", "distance": "2 km", "eta": "5 min"},
    {"name": "Sofia", "car": "Logan", "distance": "3 km", "eta": "7 min"},
    {"name": "Moussa", "car": "Peugeot", "distance": "1.5 km", "eta": "4 min"},
    {"name": "Houria", "car": "Renault", "distance": "2.5 km", "eta": "6 min"},
    {"name": "Youssef", "car": "Dacia", "distance": "4 km", "eta": "10 min"},
  ];

  int? selectedIndex; // Index du chauffeur sélectionné

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
          // 👆 Poignée
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
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),          ),
          const SizedBox(height: 12),

          // 🔽 Liste
          Expanded(
            child: ListView.builder(
              controller: widget.scrollController,
              itemCount: drivers.length,
              itemBuilder: (context, index) {
                final driver = drivers[index];
                bool isSelected = selectedIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index; // Sélection du chauffeur
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected ? const Color(0xFFF67F00) : Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DriverCard(
                      driverName: driver["name"]!,
                      carType: driver["car"]!,
                      distance: driver["distance"]!,
                      eta: driver["eta"]!,
                      highlight: isSelected, // si ton DriverCard peut recevoir un highlight
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          // Boutons Choisir / Annuler
          Row(
            children: [
              Expanded(
                child: ButtonWidget(
                  titre: "Choisir",
                  onPressed: selectedIndex != null
                      ? () {
                          final driver = drivers[selectedIndex!];
                          // Action à réaliser avec le chauffeur sélectionné
                          print("Chauffeur choisi: ${driver["name"]}");
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Test2(),
                            ),
                          ); // Retourne le chauffeur sélectionné
                        }
                      : null, // Désactivé si aucun chauffeur choisi
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
                  onPressed: () {
                    Navigator.pop(context); // Fermer le BottomSheet
                  },
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
