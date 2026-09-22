import '../../domain/entities/random_result.dart';
import '../../domain/repositories/random_repository.dart';
import '../datasources/random_local_data_source.dart';

/// Lớp triển khai (Implementation) interface [RandomRepository] thuộc tầng Domain.
/// Đóng vai trò cầu nối trung gian điều phối dữ liệu từ [RandomLocalDataSource] về cho tầng Domain.
class RandomRepositoryImpl implements RandomRepository {
  /// Nguồn dữ liệu cục bộ
  final RandomLocalDataSource localDataSource;

  RandomRepositoryImpl({required this.localDataSource});

  @override
  RandomResult getRandomNumber({required int min, required int max}) {
    // Ủy quyền nhiệm vụ sinh số ngẫu nhiên cho Local Data Source
    return localDataSource.generateRandom(min, max);
  }
}
