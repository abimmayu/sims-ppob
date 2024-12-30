import 'package:dartz/dartz.dart';
import 'package:sims_ppob_abim/core/error/failure.dart';
import 'package:sims_ppob_abim/feature/payment/data/models/response/payment_response.dart';

abstract class PaymentRepository {
  Future<Either<Failure, PaymentResponse>> pay(
    String transactionType,
    String serviceCode,
    int amount,
  );
}
