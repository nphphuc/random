import 'package:flutter/material.dart';
import '../../data/datasources/random_local_data_source.dart';
import '../../data/repositories/random_repository_impl.dart';
import '../../domain/usecases/get_random_number.dart';

import '../controller/random_controller.dart';
import '../widgets/random_box.dart';

/// Màn hình chính của tính năng sinh số ngẫu nhiên.
/// Sử dụng [StatefulWidget] để quản lý vòng đời của các [TextEditingController] và [RandomController].
class RandomScreen extends StatefulWidget {
  /// Controller quản lý trạng thái, cho phép truyền từ bên ngoài (ví dụ: phục vụ Dependency Injection hoặc Unit Test)
  final RandomController? controller;

  const RandomScreen({super.key, this.controller});

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  /// Controller chính chịu trách nhiệm quản lý logic giao diện
  late final RandomController _controller;

  /// Điều khiển dữ liệu nhập vào ô Min (giá trị mặc định ban đầu là '1')
  final TextEditingController _minController = TextEditingController(text: '1');

  /// Điều khiển dữ liệu nhập vào ô Max (giá trị mặc định ban đầu là '6')
  final TextEditingController _maxController = TextEditingController(text: '6');

  @override
  void initState() {
    super.initState();
    // Kiểm tra nếu controller được truyền từ bên ngoài thì sử dụng,
    // ngược lại sẽ tự khởi tạo nội bộ cùng đầy đủ các phụ thuộc (Dependencies).
    if (widget.controller != null) {
      _controller = widget.controller!;
    } else {
      final dataSource = RandomLocalDataSourceImpl();
      final repository = RandomRepositoryImpl(localDataSource: dataSource);
      final usecase = GetRandomNumber(repository);
      _controller = RandomController(getRandomNumber: usecase);
    }
  }

  @override
  void dispose() {
    // Giải phóng tài nguyên của controller nếu nó được khởi tạo nội bộ trong State này
    if (widget.controller == null) {
      _controller.dispose();
    }
    // Giải phóng tài nguyên các ô nhập liệu khi Widget bị hủy khỏi cây Widget
    _minController.dispose();
    _maxController.dispose();
    super.dispose();
  }

  /// Hàm xử lý khi người dùng nhấn nút "Generate".
  void _onGeneratePressed() {
    // Chuyển đổi dữ liệu chuỗi từ ô nhập sang số nguyên
    final int? min = int.tryParse(_minController.text.trim());
    final int? max = int.tryParse(_maxController.text.trim());

    // Kiểm tra tính hợp lệ của đầu vào: phải là số hợp lệ và Min <= Max
    if (min == null || max == null || min > max) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập Min <= Max hợp lệ')),
      );
      return;
    }

    // Yêu cầu Controller sinh số ngẫu nhiên
    _controller.generate(min: min, max: max);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Random Generator')),
      body: Center(
        // ListenableBuilder lắng nghe sự thay đổi từ _controller.
        // Tự động vẽ lại (rebuild) khung RandomBox mỗi khi _controller gọi notifyListeners().
        child: ListenableBuilder(
          listenable: _controller,
          builder: (context, _) {
            final result = _controller.result;
            return RandomBox(
              minController: _minController,
              maxController: _maxController,
              onGenerate: _onGeneratePressed,
              result: result?.value,
              lastMin: result?.min,
              lastMax: result?.max,
              timestamp: result?.timestamp,
            );
          },
        ),
      ),
    );
  }
}
