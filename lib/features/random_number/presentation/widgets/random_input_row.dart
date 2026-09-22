import 'package:flutter/material.dart';

class RandomInputRow extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const RandomInputRow({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 38,
          child: Text(
            label,
            style: const TextStyle(fontSize: 13, color: Colors.black87),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 24,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 13),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 6),
                border: OutlineInputBorder(borderRadius: BorderRadius.zero),
              ),
            ),
          ),
        ),
      ],
    );
  }
}