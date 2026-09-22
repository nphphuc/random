import 'package:flutter/material.dart';

class RandomHeader extends StatelessWidget {
  const RandomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      color: const Color(0xFFC7CDFF),
      child: const Text(
        'True Random Number\nGenerator',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          height: 1.2,
          color: Colors.black87,
        ),
      ),
    );
  }
}