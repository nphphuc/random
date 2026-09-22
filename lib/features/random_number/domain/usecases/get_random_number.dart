import '../entities/random_result.dart';
import '../repositories/random_repository.dart';

class GetRandomNumber {
  final RandomRepository repository;

  GetRandomNumber(this.repository);

  RandomResult call({required int min, required int max}) {
    if (min > max) {
      throw ArgumentError('Min không được lớn hơn Max');
    }
    return repository.getRandomNumber(min: min, max: max);
  }
}