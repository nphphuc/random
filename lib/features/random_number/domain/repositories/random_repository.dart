import '../entities/random_result.dart';

abstract class RandomRepository {
  RandomResult getRandomNumber({required int min, required int max});
}