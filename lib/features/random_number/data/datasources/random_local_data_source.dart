import 'dart:math';
import '../models/random_result_model.dart';

abstract class RandomLocalDataSource {
  RandomResultModel generateRandom(int min, int max);
}

class RandomLocalDataSourceImpl implements RandomLocalDataSource {
  final Random _random;

  RandomLocalDataSourceImpl({Random? random}) : _random = random ?? Random();

  @override
  RandomResultModel generateRandom(int min, int max) {
    final value = min + _random.nextInt(max - min + 1);
    final now = DateTime.now().toUtc();
    return RandomResultModel.create(
      value: value,
      min: min,
      max: max,
      time: now,
    );
  }
}