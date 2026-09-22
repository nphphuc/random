import 'dart:math';
import '../models/random_result_model.dart';

/// Interface định nghĩa nguồn cung cấp dữ liệu cục bộ (Local Data Source).
abstract class RandomLocalDataSource {
  /// Hàm sinh dữ liệu số ngẫu nhiên dưới dạng [RandomResultModel].
  RandomResultModel generateRandom(int min, int max);
}

/// Lớp triển khai thực tế của [RandomLocalDataSource] sử dụng thư viện [Random] mặc định của Dart.
class RandomLocalDataSourceImpl implements RandomLocalDataSource {
  /// Thư viện ngẫu nhiên của Dart
  final Random _random;

  /// Constructor nhận vào một đối tượng [Random] tùy chọn.
  /// Việc này giúp hỗ trợ Dependency Injection và dễ dàng Mock khi thực hiện Unit Test.
  RandomLocalDataSourceImpl({Random? random}) : _random = random ?? Random();

  @override
  RandomResultModel generateRandom(int min, int max) {
    // Thuật toán sinh số nguyên ngẫu nhiên bao gồm cả hai đầu [min] và [max]:
    // nextInt(N) sinh giá trị từ 0 đến N - 1.
    // Với N = (max - min + 1), kết quả nằm trong khoảng [0, max - min].
    // Cộng thêm [min] sẽ dịch chuyển phạm vi thành [min, max].
    final value = min + _random.nextInt(max - min + 1);

    // Lấy thời điểm hiện tại ở múi giờ UTC
    final now = DateTime.now().toUtc();

    return RandomResultModel.create(
      value: value,
      min: min,
      max: max,
      time: now,
    );
  }
}
