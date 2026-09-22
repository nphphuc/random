import 'package:flutter/material.dart';
import 'features/random_number/data/datasources/random_local_data_source.dart';
import 'features/random_number/data/repositories/random_repository_impl.dart';
import 'features/random_number/domain/usecases/get_random_number.dart';
import 'features/random_number/presentation/controller/random_controller.dart';
import 'features/random_number/presentation/screens/random_screen.dart';

/// Điểm khởi chạy chính (Entry Point) của ứng dụng Flutter.
void main() {
  // Setup Dependency Injection (DI) thủ công theo kiến trúc Clean Architecture:
  // 1. Khởi tạo Data Source để lấy/sinh dữ liệu ngẫu nhiên
  final dataSource = RandomLocalDataSourceImpl();

  // 2. Khởi tạo Repository triển khai interface ở lớp Domain
  final repository = RandomRepositoryImpl(localDataSource: dataSource);

  // 3. Khởi tạo Use Case chứa nghiệp vụ chính
  final usecase = GetRandomNumber(repository);

  // 4. Khởi tạo Controller (State Management) để giao tiếp với UI
  final controller = RandomController(getRandomNumber: usecase);

  // Khởi chạy ứng dụng Flutter với MyApp
  runApp(MyApp(controller: controller));
}

/// Widget gốc (Root Widget) của ứng dụng.
class MyApp extends StatelessWidget {
  /// Controller quản lý trạng thái cho tính năng sinh số ngẫu nhiên
  final RandomController controller;

  const MyApp({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Tắt banner "DEBUG" ở góc trên bên phải màn hình
      debugShowCheckedModeBanner: false,
      // Màn hình chính của ứng dụng
      home: RandomScreen(controller: controller),
    );
  }
}
