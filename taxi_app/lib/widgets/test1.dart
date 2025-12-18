import 'package:flutter/material.dart';
import 'package:taxi_app/widgets/bottom_sheet_drivers.dart';

class Test1 extends StatelessWidget {
  const Test1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Texte en haut
          Container(
            padding: const EdgeInsets.only(top: 50),
            child: const Text(
              "Bonjour !!!!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          
          Expanded(
            child: Container(
              color: Colors.transparent,
              child: const Center(
                child: Text(
                  'Contenu central',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          
          // BottomPanel en bas
          BottomPanelDriver(
          ),
        ],
      ),
    );
  }
}