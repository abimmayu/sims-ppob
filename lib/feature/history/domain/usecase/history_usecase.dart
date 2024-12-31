import 'package:dartz/dartz.dart';
import 'package:sims_ppob_abim/core/error/failure.dart';
import 'package:sims_ppob_abim/feature/history/data/models/history_response.dart';
import 'package:sims_ppob_abim/feature/history/domain/repository/history_repository.dart';

class HistoryUsecase {
  final HistoryRepository historyRepository;

  HistoryUsecase(this.historyRepository);

  Future<Either<Failure, HistoryResponse>> getHistory(
    String offset,
    String limits,
  ) async {
    return await historyRepository.getHistory(offset, limits);
  }
}
