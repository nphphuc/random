abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}