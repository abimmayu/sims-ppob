import 'package:dartz/dartz.dart';
import 'package:sims_ppob_abim/core/error/failure.dart';
import 'package:sims_ppob_abim/feature/history/data/models/history_response.dart';

abstract class HistoryRepository {
  Future<Either<Failure, HistoryResponse>> getHistory(
      String offset, String limit);
}
