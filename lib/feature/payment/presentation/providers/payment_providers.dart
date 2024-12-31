import 'package:flutter/material.dart';
import 'package:sims_ppob_abim/feature/payment/domain/entity/payment.dart';
import 'package:sims_ppob_abim/feature/payment/domain/usecase/payment_usecase.dart';

class PaymentProviders with ChangeNotifier {
  final PaymentUsecase paymentUsecase;

  PaymentProviders({required this.paymentUsecase});

  bool _isLoading = false;
  String? _errorMessage;
  bool? _isPaymentSuccess;
  Payment? _payment;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool? get isPaymentSuccess => _isPaymentSuccess;
  Payment? get payment => _payment;

  void _updateState({
    bool? isLoading,
    String? errorMessage,
    bool? isPaymentSuccess,
    Payment? payment,
  }) {
    if (isLoading != null) _isLoading = isLoading;
    if (errorMessage != null) _errorMessage = errorMessage;
    if (isPaymentSuccess != null) _isPaymentSuccess = isPaymentSuccess;
    if (payment != null) _payment = payment;
    notifyListeners();
  }

  Future<void> getPayment(
      String transactionType, String serviceCode, int amount) async {
    _updateState(isLoading: true, errorMessage: null, isPaymentSuccess: null);

    try {
      final response =
          await paymentUsecase.getPayment(transactionType, serviceCode, amount);
      response.fold(
        (failure) => _updateState(
          isLoading: false,
          isPaymentSuccess: false,
          errorMessage: failure.message,
        ),
        (success) => _updateState(
          isLoading: false,
          isPaymentSuccess: true,
          payment: success.data,
        ),
      );
    } catch (e) {
      _updateState(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }
}
