import 'package:dartz/dartz.dart';
import 'package:sims_ppob_abim/core/error/failure.dart';
import 'package:sims_ppob_abim/feature/topup/data/models/topup_response.dart';

abstract class TopupRepository {
  Future<Either<Failure, TopupResponse>> getBalance();
  Future<Either<Failure, TopupResponse>> topup(int balance);
}
