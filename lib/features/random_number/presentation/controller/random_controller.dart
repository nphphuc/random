import 'package:flutter/foundation.dart';
import '../../domain/entities/random_result.dart';
import '../../domain/usecases/get_random_number.dart';

class RandomController extends ChangeNotifier {
  final GetRandomNumber _getRandomNumber;

  RandomController({required GetRandomNumber getRandomNumber})
      : _getRandomNumber = getRandomNumber;

  RandomResult? _result;
  RandomResult? get result => _result;

  void generate({required int min, required int max}) {
    _result = _getRandomNumber(min: min, max: max);
    notifyListeners();
  }
}