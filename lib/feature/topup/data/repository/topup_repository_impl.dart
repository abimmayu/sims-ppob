import 'package:dartz/dartz.dart';
import 'package:sims_ppob_abim/core/error/failure.dart';
import 'package:sims_ppob_abim/core/error/module_transaction_error.dart';
import 'package:sims_ppob_abim/feature/topup/data/datasource/topup_datasource.dart';
import 'package:sims_ppob_abim/feature/topup/data/models/topup_response.dart';
import 'package:sims_ppob_abim/feature/topup/domain/repository/topup_repository.dart';

class TopupRepositoryImpl implements TopupRepository {
  final TopupDatasource topupDatasource;

  TopupRepositoryImpl(this.topupDatasource);

  @override
  Future<Either<Failure, TopupResponse>> getBalance() async {
    try {
      final response = await topupDatasource.getBalance();
      return Right(response);
    } catch (e) {
      return Left(
        BalanceError(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, TopupResponse>> topup(int balance) async {
    try {
      final response = await topupDatasource.topup(balance);
      return Right(response);
    } catch (e) {
      return Left(
        TopupError(
          message: e.toString(),
        ),
      );
    }
  }
}
