import 'package:flutter/material.dart';
import 'package:sims_ppob_abim/feature/history/domain/entity/history.dart';
import 'package:sims_ppob_abim/feature/history/domain/usecase/history_usecase.dart';

class HistoryProviders with ChangeNotifier {
  final HistoryUsecase historyUsecase;

  HistoryProviders(this.historyUsecase);

  bool _isLoading = false;
  final List<History> _history = [];
  String? _errorMessage;
  int _offset = 0;
  final int _limit = 100;
  bool _hasMore = true;

  bool get isLoading => _isLoading;
  List<History> get history => _history;
  String? get errorMessage => _errorMessage;
  bool get hasMore => _hasMore;

  void _updateState({
    bool? isLoading,
    List<History>? history,
    String? errorMessage,
    bool? hasMore,
    int? offset,
  }) {
    if (isLoading != null) _isLoading = isLoading;
    if (history != null) _history.addAll(history);
    if (errorMessage != null) _errorMessage = errorMessage;
    if (hasMore != null) _hasMore = hasMore;
    if (offset != null) _offset = offset;
    notifyListeners();
  }

  Future<void> getHistory() async {
    if (!_hasMore || _isLoading) return;

    _updateState(isLoading: true, errorMessage: null);
    try {
      final result = await historyUsecase.getHistory(
        "$_offset",
        "$_limit",
      );
      result.fold(
        (failure) => _updateState(
          errorMessage: failure.message,
          isLoading: false,
        ),
        (r) {
          final newRecords = r.data.records;
          _updateState(
            isLoading: false,
            history: newRecords,
            hasMore: newRecords.length == _limit,
            offset: _offset + newRecords.length,
          );
        },
      );
    } catch (e) {
      _updateState(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  void resetPagination() {
    _history.clear();
    _offset = 0;
    _hasMore = true;
    notifyListeners();
  }
}
