/// Lớp cơ sở (Abstract Class) đại diện cho các lỗi hoặc thất bại trong hệ thống.
/// Trong Clean Architecture, các Failure giúp chuẩn hóa việc quản lý và phản hồi lỗi từ các tầng dữ liệu.
abstract class Failure {
  /// Thông điệp mô tả chi tiết về lỗi
  final String message;

  const Failure(this.message);
}

/// Lỗi đại diện cho trường hợp dữ liệu đầu vào không hợp lệ (Validation Failure).
class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}
