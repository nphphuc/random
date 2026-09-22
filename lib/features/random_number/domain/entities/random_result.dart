/// Entity đại diện cho kết quả sinh số ngẫu nhiên thuộc tầng Domain.
/// Trong Clean Architecture, Entity chứa các đối tượng dữ liệu nghiệp vụ cốt lõi,
/// độc lập hoàn toàn với cơ sở dữ liệu, giao diện người dùng (UI) hay các framework bên ngoài.
class RandomResult {
  /// Giá trị số ngẫu nhiên được sinh ra
  final int value;

  /// Giá trị nhỏ nhất (Min) trong khoảng giới hạn
  final int min;

  /// Giá trị lớn nhất (Max) trong khoảng giới hạn
  final int max;

  /// Mốc thời gian (Timestamp) thực hiện sinh số ngẫu nhiên
  final String timestamp;

  const RandomResult({
    required this.value,
    required this.min,
    required this.max,
    required this.timestamp,
  });
}
