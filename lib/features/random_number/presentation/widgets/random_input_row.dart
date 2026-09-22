import 'package:flutter/material.dart';

/// Widget tái sử dụng hiển thị một hàng nhập liệu bao gồm nhãn (Label) và ô nhập văn bản (TextField).
class RandomInputRow extends StatelessWidget {
  /// Chuỗi hiển thị tên nhãn (ví dụ: "Min:", "Max:")
  final String label;

  /// Controller điều khiển dữ liệu ô văn bản tương ứng
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
        // Độ rộng cố định cho nhãn để các ô nhập nằm thẳng hàng
        SizedBox(
          width: 38,
          child: Text(
            label,
            style: const TextStyle(fontSize: 13, color: Colors.black87),
          ),
        ),
        // Ô nhập liệu chiếm phần diện tích còn lại của hàng
        Expanded(
          child: SizedBox(
            height: 24,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number, // Chỉ cho phép nhập số
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
