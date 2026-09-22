import 'package:flutter/material.dart';
import 'features/random_number/data/datasources/random_local_data_source.dart';
import 'features/random_number/data/repositories/random_repository_impl.dart';
import 'features/random_number/domain/usecases/get_random_number.dart';
import 'features/random_number/presentation/controller/random_controller.dart';
import 'features/random_number/presentation/screens/random_screen.dart';

void main() {
  // Setup Dependency Injection thủ công
  final dataSource = RandomLocalDataSourceImpl();
  final repository = RandomRepositoryImpl(localDataSource: dataSource);
  final usecase = GetRandomNumber(repository);
  final controller = RandomController(getRandomNumber: usecase);

  runApp(MyApp(controller: controller));
}

class MyApp extends StatelessWidget {
  final RandomController controller;

  const MyApp({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RandomScreen(controller: controller),
    );
  }
}