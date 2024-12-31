import 'package:sims_ppob_abim/core/constant/app_url.dart';
import 'package:sims_ppob_abim/core/services/api_services/dio.dart';
import 'package:sims_ppob_abim/feature/history/data/models/history_response.dart';

abstract class HistoryDatasource {
  Future<HistoryResponse> getHistory(String offset, String limits);
}

class HistoryDatasourceImpl implements HistoryDatasource {
  final DioService dioService;

  HistoryDatasourceImpl(this.dioService);

  @override
  Future<HistoryResponse> getHistory(String offset, String limits) async {
    final response = await dioService.get(
      "${AppUrl.history}?offset=$offset&limit=$limits",
    );
    return HistoryResponse.fromJson(response.data);
  }
}
