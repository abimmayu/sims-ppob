import 'package:dartz/dartz.dart';
import 'package:sims_ppob_abim/core/error/failure.dart';
import 'package:sims_ppob_abim/feature/home/data/models/response/banner_response.dart';
import 'package:sims_ppob_abim/feature/home/domain/repository/home_repository.dart';

class BannerUsecase {
  final HomeRepository homeRepository;

  BannerUsecase(this.homeRepository);

  Future<Either<Failure, BannerResponse>> getBanner() async {
    return await homeRepository.getBanner();
  }
}
