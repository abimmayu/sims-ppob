import 'package:dartz/dartz.dart';
import 'package:sims_ppob_abim/core/error/failure.dart';
import 'package:sims_ppob_abim/feature/topup/data/models/topup_response.dart';
import 'package:sims_ppob_abim/feature/topup/domain/repository/topup_repository.dart';

class TopupUsecase {
  final TopupRepository topupRepository;

  TopupUsecase(this.topupRepository);

  Future<Either<Failure, TopupResponse>> topup(int balance) async {
    return await topupRepository.topup(balance);
  }
}
