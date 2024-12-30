import 'package:dartz/dartz.dart';
import 'package:sims_ppob_abim/core/error/failure.dart';
import 'package:sims_ppob_abim/feature/payment/data/models/response/payment_response.dart';
import 'package:sims_ppob_abim/feature/payment/domain/repository/payment_respository_impl.dart';

class PaymentUsecase {
  final PaymentRepository paymentRepository;

  PaymentUsecase({required this.paymentRepository});

  Future<Either<Failure, PaymentResponse>> getPayment(
    String transactionType,
    String serviceCode,
    int amount,
  ) async {
    return await paymentRepository.pay(transactionType, serviceCode, amount);
  }
}
