import 'package:flutter/material.dart';

/// Widget hiển thị khu vực kết quả sau khi bấm sinh số.
/// Bao gồm con số kết quả in đậm, giới hạn phạm vi Min/Max và mốc thời gian chi tiết.
class RandomResultView extends StatelessWidget {
  /// Giá trị kết quả thu được
  final int? result;

  /// Giá trị Min tương ứng
  final int? min;

  /// Giá trị Max tương ứng
  final int? max;

  /// Mốc thời gian sinh ra kết quả
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
          // Con số kết quả cỡ lớn (nếu chưa sinh số sẽ hiển thị ký tự '-')
          Text(
            result != null ? '$result' : '-',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'serif',
            ),
          ),
          // Chỉ hiển thị thông tin chi tiết phạm vi và thời gian nếu có kết quả
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
