import '../../domain/entities/random_result.dart';
import '../../domain/repositories/random_repository.dart';
import '../datasources/random_local_data_source.dart';

class RandomRepositoryImpl implements RandomRepository {
  final RandomLocalDataSource localDataSource;

  RandomRepositoryImpl({required this.localDataSource});

  @override
  RandomResult getRandomNumber({required int min, required int max}) {
    return localDataSource.generateRandom(min, max);
  }
}