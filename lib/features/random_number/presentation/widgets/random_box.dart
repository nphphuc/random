import 'package:flutter/material.dart';
import 'random_footer.dart';
import 'random_header.dart';
import 'random_input_row.dart';
import 'random_result_view.dart';

class RandomBox extends StatelessWidget {
  final TextEditingController minController;
  final TextEditingController maxController;
  final VoidCallback onGenerate;
  final int? result;
  final int? lastMin;
  final int? lastMax;
  final String? timestamp;

  const RandomBox({
    super.key,
    required this.minController,
    required this.maxController,
    required this.onGenerate,
    this.result,
    this.lastMin,
    this.lastMax,
    this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFC2C5FB), width: 1.5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const RandomHeader(),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RandomInputRow(label: 'Min:', controller: minController),
                const SizedBox(height: 8),
                RandomInputRow(label: 'Max:', controller: maxController),
                const SizedBox(height: 10),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFFEEEEEE),
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.grey),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: onGenerate,
                  child: const Text('Generate', style: TextStyle(fontSize: 13)),
                ),
                const SizedBox(height: 8),
                const Text('Result:', style: TextStyle(fontSize: 13)),
                const SizedBox(height: 4),
                RandomResultView(
                  result: result,
                  min: lastMin,
                  max: lastMax,
                  timestamp: timestamp,
                ),
                const SizedBox(height: 10),
                const RandomFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}