import 'package:flutter/foundation.dart';
import '../../domain/entities/random_result.dart';
import '../../domain/usecases/get_random_number.dart';

/// Controller quản lý trạng thái (State Management) thuộc tầng Presentation.
/// Kế thừa từ [ChangeNotifier] trong Flutter để phát tín hiệu khi trạng thái dữ liệu thay đổi.
class RandomController extends ChangeNotifier {
  /// Instance của Use Case chứa logic nghiệp vụ
  final GetRandomNumber _getRandomNumber;

  RandomController({required GetRandomNumber getRandomNumber})
      : _getRandomNumber = getRandomNumber;

  /// Biến private lưu trữ kết quả sinh số ngẫu nhiên
  RandomResult? _result;

  /// Getter cho phép UI truy cập kết quả sinh số ngẫu nhiên hiện tại
  RandomResult? get result => _result;

  /// Hàm gọi Use Case để tạo số ngẫu nhiên mới trong khoảng từ [min] đến [max].
  /// Sau khi cập nhật [_result], gọi [notifyListeners] để yêu cầu UI vẽ lại (re-render).
  void generate({required int min, required int max}) {
    _result = _getRandomNumber(min: min, max: max);
    notifyListeners();
  }
}
