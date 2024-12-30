import 'package:sims_ppob_abim/core/constant/app_url.dart';
import 'package:sims_ppob_abim/core/services/api_services/dio.dart';
import 'package:sims_ppob_abim/feature/home/data/models/response/banner_response.dart';
import 'package:sims_ppob_abim/feature/home/data/models/response/services_response.dart';

abstract class HomeDatasource {
  Future<BannerResponse> getBanner();
  Future<ServicesResponse> getServices();
}

class HomeDatasourceImpl extends HomeDatasource {
  final DioService dioService;

  HomeDatasourceImpl(this.dioService);

  @override
  Future<BannerResponse> getBanner() async {
    final response = await dioService.get(AppUrl.banner);
    return BannerResponse.fromJson(response.data);
  }

  @override
  Future<ServicesResponse> getServices() async {
    final response = await dioService.get(AppUrl.services);
    return ServicesResponse.fromJson(response.data);
  }
}
