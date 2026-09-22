import 'package:flutter/material.dart';

class RandomResultView extends StatelessWidget {
  final int? result;
  final int? min;
  final int? max;
  final String? timestamp;

  const RandomResultView({
    super.key,
    this.result,
    this.min,
    this.max,
    this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      color: const Color(0xFFC7CDFF),
      child: Column(
        children: [
          Text(
            result != null ? '$result' : '-',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
            ),
          ),
          if (result != null) ...[
            Text(
              'Min: $min, Max: $max',
              style: const TextStyle(fontSize: 11, fontFamily: 'serif'),
            ),
            Text(
              timestamp ?? '',
              style: const TextStyle(fontSize: 10, fontFamily: 'serif'),
            ),
          ],
        ],
      ),
    );
  }
}