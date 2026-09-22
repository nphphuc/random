import '../entities/random_result.dart';

/// Interface quy định hợp đồng (Contract) cho Repository thuộc tầng Domain.
/// Tầng Domain định nghĩa giao diện này để đảm bảo nguyên tắc Đảo ngược Phụ thuộc (Dependency Inversion Principle),
/// giúp tầng Domain không bị phụ thuộc vào các chi tiết triển khai cụ thể ở tầng Data.
abstract class RandomRepository {
  /// Hàm tạo ra kết quả số ngẫu nhiên nằm trong đoạn từ [min] đến [max].
  RandomResult getRandomNumber({required int min, required int max});
}
