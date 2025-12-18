import 'package:flutter/material.dart';


class BottomPanel extends StatelessWidget {
  final String texte; 

  const BottomPanel({
    super.key,
    required this.texte, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFFF67F00),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          texte,
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      
    );
  }
}