
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String titre;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color color;
  final Color colorFont;
  final bool enabled;

  const ButtonWidget({
    super.key,
    required this.titre,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.color,
    required this.colorFont,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: colorFont,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: color == Colors.white
              ? BorderSide(color: colorFont)
              : BorderSide.none,
        ),
      ),
      child: Text(titre),
    );
  }
}
