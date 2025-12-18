import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {

  final String titre;
  final VoidCallback onPressed;
  const ButtonWidget({
    required this.titre,
    required this.onPressed,
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      child: Text(titre),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFF67F00),
        foregroundColor: Colors.white,
        minimumSize: const Size(200, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), 
        ),
      ),
    );
  }
}
