import 'package:flutter/material.dart';
import '../../data/datasources/random_local_data_source.dart';
import '../../data/repositories/random_repository_impl.dart';
import '../../domain/usecases/get_random_number.dart';

import '../controller/random_controller.dart';
import '../widgets/random_box.dart';

class RandomScreen extends StatefulWidget {
  final RandomController? controller;

  const RandomScreen({super.key, this.controller});

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  late final RandomController _controller;
  final TextEditingController _minController = TextEditingController(text: '1');
  final TextEditingController _maxController = TextEditingController(text: '6');

  @override
  void initState() {
    super.initState();
    // Tự khởi tạo controller cục bộ nếu bên ngoài không truyền vào, tránh bị lỗi Null
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
    // Chỉ giải phóng controller nếu nó được khởi tạo nội bộ trong State
    if (widget.controller == null) {
      _controller.dispose();
    }
    _minController.dispose();
    _maxController.dispose();
    super.dispose();
  }

  void _onGeneratePressed() {
    final int? min = int.tryParse(_minController.text.trim());
    final int? max = int.tryParse(_maxController.text.trim());

    if (min == null || max == null || min > max) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập Min <= Max hợp lệ')),
      );
      return;
    }

    _controller.generate(min: min, max: max);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Random Generator')),
      body: Center(
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