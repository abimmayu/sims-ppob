import 'package:dartz/dartz.dart';
import 'package:sims_ppob_abim/core/error/failure.dart';
import 'package:sims_ppob_abim/feature/topup/data/models/topup_response.dart';
import 'package:sims_ppob_abim/feature/topup/domain/repository/topup_repository.dart';

class BalanceUsecase {
  final TopupRepository topupRepository;

  BalanceUsecase(this.topupRepository);

  Future<Either<Failure, TopupResponse>> getBalance() async {
    return await topupRepository.getBalance();
  }
}
