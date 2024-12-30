import 'package:dartz/dartz.dart';
import 'package:sims_ppob_abim/core/error/failure.dart';
import 'package:sims_ppob_abim/core/error/payment_error.dart';
import 'package:sims_ppob_abim/feature/payment/data/datasource/payment_datasource.dart';
import 'package:sims_ppob_abim/feature/payment/data/models/response/payment_response.dart';
import 'package:sims_ppob_abim/feature/payment/domain/repository/payment_respository_impl.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentDatasource paymentDatasource;

  PaymentRepositoryImpl({required this.paymentDatasource});
  @override
  Future<Either<Failure, PaymentResponse>> pay(
      String transactionType, String serviceCode, int amount) async {
    try {
      final response =
          await paymentDatasource.pay(transactionType, serviceCode, amount);
      return Right(response);
    } catch (e) {
      return Left(PaymentFailed(message: e.toString()));
    }
  }
}
