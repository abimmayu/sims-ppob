import 'package:dartz/dartz.dart';
import 'package:sims_ppob_abim/core/error/failure.dart';
import 'package:sims_ppob_abim/feature/home/data/models/response/banner_response.dart';
import 'package:sims_ppob_abim/feature/home/data/models/response/services_response.dart';

abstract class HomeRepository {
  Future<Either<Failure, BannerResponse>> getBanner();
  Future<Either<Failure, ServicesResponse>> getServices();
}
