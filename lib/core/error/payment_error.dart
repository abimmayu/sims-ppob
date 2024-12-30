import 'package:sims_ppob_abim/core/error/failure.dart';

class PaymentError implements Failure {
  @override
  final String title;
  @override
  final String message;

  PaymentError({required this.title, required this.message});

  @override
  String toString() {
    return message;
  }
}

class PaymentFailed extends PaymentError {
  PaymentFailed({
    super.title = 'Payment Failed',
    super.message = 'Payment failed',
  });
}
