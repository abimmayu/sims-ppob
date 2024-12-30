import 'package:sims_ppob_abim/core/constant/app_url.dart';
import 'package:sims_ppob_abim/core/services/api_services/dio.dart';
import 'package:sims_ppob_abim/feature/payment/data/models/request/payment_request.dart';
import 'package:sims_ppob_abim/feature/payment/data/models/response/payment_response.dart';

abstract class PaymentDatasource {
  Future<PaymentResponse> pay(
    String transactionType,
    String serviceCode,
    int amount,
  );
}

class PaymentDatasourceImpl implements PaymentDatasource {
  final DioService dioService;

  PaymentDatasourceImpl(this.dioService);

  @override
  Future<PaymentResponse> pay(
    String transactionType,
    String serviceCode,
    int amount,
  ) async {
    final response = await dioService.post(
      AppUrl.transaction,
      PaymentRequest(
        transactionType,
        serviceCode,
        amount,
      ).toJson(),
    );
    return PaymentResponse.fromJson(response.data);
  }
}
