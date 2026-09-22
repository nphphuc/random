import 'package:flutter/material.dart';
import 'random_footer.dart';
import 'random_header.dart';
import 'random_input_row.dart';
import 'random_result_view.dart';

/// Widget tổng hợp (Container Widget) đóng gói toàn bộ giao diện bảng sinh số ngẫu nhiên.
/// Được thiết kế theo phong cách giao diện cổ điển của tiện ích RANDOM.ORG.
class RandomBox extends StatelessWidget {
  /// Controller quản lý giá trị nhập ô Min
  final TextEditingController minController;

  /// Controller quản lý giá trị nhập ô Max
  final TextEditingController maxController;

  /// Callback hàm xử lý được gọi khi nhấn vào nút "Generate"
  final VoidCallback onGenerate;

  /// Kết quả số ngẫu nhiên được sinh ra (null nếu chưa bấm sinh số)
  final int? result;

  /// Giá trị Min tương ứng với kết quả hiện tại
  final int? lastMin;

  /// Giá trị Max tương ứng với kết quả hiện tại
  final int? lastMax;

  /// Chuỗi hiển thị mốc thời gian kết quả được sinh ra
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
        // Viền xanh nhạt đặc trưng xung quanh bảng
        border: Border.all(color: const Color(0xFFC2C5FB), width: 1.5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Banner tiêu đề ở trên cùng
          const RandomHeader(),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ô nhập giá trị tối thiểu Min
                RandomInputRow(label: 'Min:', controller: minController),
                const SizedBox(height: 8),
                // Ô nhập giá trị tối đa Max
                RandomInputRow(label: 'Max:', controller: maxController),
                const SizedBox(height: 10),
                // Nút "Generate" để yêu cầu sinh số
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
                // Khung hiển thị chi tiết kết quả thu được
                RandomResultView(
                  result: result,
                  min: lastMin,
                  max: lastMax,
                  timestamp: timestamp,
                ),
                const SizedBox(height: 10),
                // Chân trang ghi nguồn "Powered by RANDOM.ORG"
                const RandomFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
