import 'package:sims_ppob_abim/core/error/failure.dart';

class ModuleTransactionError implements Failure {
  @override
  final String message;
  @override
  final String title;

  ModuleTransactionError({
    required this.title,
    this.message = 'An error occurred',
  });

  @override
  String toString() {
    return message;
  }
}

class BalanceError extends ModuleTransactionError {
  BalanceError({
    super.message = 'Balance failed',
    super.title = 'Balance Error',
  });
}

class TopupError extends ModuleTransactionError {
  TopupError({
    super.message = 'Topup failed',
    super.title = 'Topup Error',
  });
}

class TransactionError extends ModuleTransactionError {
  TransactionError({
    super.message = 'Transaction failed',
    super.title = 'Transaction Error',
  });
}

class HistoryError extends ModuleTransactionError {
  HistoryError({
    super.message = 'History failed',
    super.title = 'History Error',
  });
}
