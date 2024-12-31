import 'package:sims_ppob_abim/core/constant/app_url.dart';
import 'package:sims_ppob_abim/core/services/api_services/dio.dart';
import 'package:sims_ppob_abim/feature/topup/data/models/topup_request.dart';
import 'package:sims_ppob_abim/feature/topup/data/models/topup_response.dart';

abstract class TopupDatasource {
  Future<TopupResponse> getBalance();
  Future<TopupResponse> topup(int topup);
}

class TopupDatasourceImpl implements TopupDatasource {
  final DioService dioService;

  TopupDatasourceImpl(this.dioService);

  @override
  Future<TopupResponse> getBalance() async {
    final response = await dioService.get(AppUrl.balance);
    return TopupResponse.fromJson(response.data);
  }

  @override
  Future<TopupResponse> topup(int balance) async {
    final response = await dioService.post(
      AppUrl.topUp,
      TopupRequest(
        balance: balance,
      ).toJson(),
    );
    return TopupResponse.fromJson(
      response.data,
    );
  }
}
