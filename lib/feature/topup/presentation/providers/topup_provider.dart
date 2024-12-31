import 'package:flutter/material.dart';
import 'package:sims_ppob_abim/feature/topup/domain/usecase/balance_usecase.dart';
import 'package:sims_ppob_abim/feature/topup/domain/usecase/topup_usecase.dart';

class TopupProvider with ChangeNotifier {
  final BalanceUsecase balanceUsecase;
  final TopupUsecase topupUsecase;

  TopupProvider(this.balanceUsecase, this.topupUsecase);

  int? _balance;
  bool _isLoading = false;
  String? _errorMessage;
  bool? _isTopupSuccess;

  int? get balance => _balance;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool? get isTopupSuccess => _isTopupSuccess;

  Future<void> _performAction(Future<void> Function() action) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await action();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getBalance() async {
    await _performAction(() async {
      final response = await balanceUsecase.getBalance();
      response.fold(
        (failure) => _errorMessage = failure.message,
        (success) => _balance = success.data?.balance,
      );
    });
  }

  Future<void> topup(int balance) async {
    await _performAction(() async {
      final response = await topupUsecase.topup(balance);
      response.fold(
        (failure) {
          _isTopupSuccess = false;
          _errorMessage = failure.message;
        },
        (success) {
          _balance = success.data?.balance;
          _isTopupSuccess = true;
        },
      );
    });
  }

  void resetState() {
    _balance = null;
    _isLoading = false;
    _errorMessage = null;
    _isTopupSuccess = null;
    notifyListeners();
  }
}
