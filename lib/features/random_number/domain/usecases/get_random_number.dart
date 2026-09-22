import '../entities/random_result.dart';
import '../repositories/random_repository.dart';

/// Use Case đóng gói quy trình và quy tắc nghiệp vụ (Business Logic) cho việc sinh số ngẫu nhiên.
/// Trong Clean Architecture, Use Case kết nối giữa tầng Presentation và tầng Domain/Data.
class GetRandomNumber {
  /// Tham chiếu tới Repository interface để thao tác với dữ liệu
  final RandomRepository repository;

  GetRandomNumber(this.repository);

  /// Cho phép gọi đối tượng Use Case như một hàm (Callable Class).
  ///
  /// Thực hiện kiểm tra quy tắc nghiệp vụ: giá trị [min] không được lớn hơn [max].
  /// Ném ra [ArgumentError] nếu phạm vi không hợp lệ.
  RandomResult call({required int min, required int max}) {
    if (min > max) {
      throw ArgumentError('Min không được lớn hơn Max');
    }
    return repository.getRandomNumber(min: min, max: max);
  }
}
