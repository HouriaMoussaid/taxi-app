import 'package:flutter/material.dart';
import 'bottom_sheet_drivers.dart';

class Test1 extends StatelessWidget {
  const Test1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Container(
            color: Colors.grey[200],
            child: const Center(
              child: Text("Carte ici", style: TextStyle(color: Colors.grey)),
            ),
          ),

          
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                locationCard(
                  "Départ",
                  Icons.my_location,
                  "Casablanca Sakani, Maroc",
                  Colors.green,
                ),
                locationCard(
                  "Destination",
                  Icons.location_on,
                  "Rabat Centre, Maroc",
                  Colors.red,
                ),
              ],
            ),
          ),

          
          Align(
            alignment: Alignment.bottomCenter, 
            child: DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.40,
              minChildSize: 0.20,
              maxChildSize: 0.85,
              builder: (context, scrollController) {
                return BottomPanelDriver(
                  scrollController: scrollController,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  static Widget locationCard(
    String title,
    IconData icon,
    String address,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(address,
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
