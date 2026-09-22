import '../../domain/entities/random_result.dart';

class RandomResultModel extends RandomResult {
  const RandomResultModel({
    required super.value,
    required super.min,
    required super.max,
    required super.timestamp,
  });

  factory RandomResultModel.create({
    required int value,
    required int min,
    required int max,
    required DateTime time,
  }) {
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