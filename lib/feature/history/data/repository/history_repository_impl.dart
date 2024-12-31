import 'package:dartz/dartz.dart';
import 'package:sims_ppob_abim/core/error/failure.dart';
import 'package:sims_ppob_abim/core/error/module_transaction_error.dart';
import 'package:sims_ppob_abim/feature/history/data/datasource/history_datasource.dart';
import 'package:sims_ppob_abim/feature/history/data/models/history_response.dart';
import 'package:sims_ppob_abim/feature/history/domain/repository/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryDatasource historyDatasource;
  HistoryRepositoryImpl(this.historyDatasource);

  @override
  Future<Either<Failure, HistoryResponse>> getHistory(
      String offset, String limit) async {
    try {
      final response = await historyDatasource.getHistory(
        offset,
        limit,
      );
      return Right(response);
    } catch (e) {
      return Left(
        HistoryError(
          message: e.toString(),
        ),
      );
    }
  }
}
