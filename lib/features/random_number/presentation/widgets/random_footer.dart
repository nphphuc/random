import 'package:flutter/material.dart';

/// Widget hiển thị chân trang (Footer) của tiện ích, ghi rõ nguồn "Powered by RANDOM.ORG".
class RandomFooter extends StatelessWidget {
  const RandomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Powered by RANDOM.ORG',
        style: TextStyle(
          fontSize: 9,
          color: Colors.blueGrey,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
