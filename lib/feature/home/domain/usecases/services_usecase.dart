import 'package:dartz/dartz.dart';
import 'package:sims_ppob_abim/core/error/failure.dart';
import 'package:sims_ppob_abim/feature/home/data/models/response/services_response.dart';
import 'package:sims_ppob_abim/feature/home/domain/repository/home_repository.dart';

class ServicesUsecase {
  final HomeRepository homeRepository;

  ServicesUsecase(this.homeRepository);

  Future<Either<Failure, ServicesResponse>> getServices() async {
    return await homeRepository.getServices();
  }
}
