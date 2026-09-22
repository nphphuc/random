import '../../domain/entities/random_result.dart';

/// Model dữ liệu thuộc tầng Data.
/// Kế thừa từ Entity [RandomResult] của tầng Domain.
/// Tầng Data chịu trách nhiệm cấu trúc dữ liệu, serialization/deserialization và chuyển đổi định dạng.
class RandomResultModel extends RandomResult {
  const RandomResultModel({
    required super.value,
    required super.min,
    required super.max,
    required super.timestamp,
  });

  /// Factory constructor hỗ trợ khởi tạo [RandomResultModel]
  /// và tự động chuyển đổi đối tượng [DateTime] thành chuỗi định dạng "YYYY-MM-DD HH:mm:ss UTC".
  factory RandomResultModel.create({
    required int value,
    required int min,
    required int max,
    required DateTime time,
  }) {
    // Định dạng chuỗi ngày tháng năm giờ phút giây theo chuẩn UTC
    final formattedTime =
        "${time.year}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')} "
        "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')} UTC";

    return RandomResultModel(
      value: value,
      min: min,
      max: max,
      timestamp: formattedTime,
    );
  }
}
