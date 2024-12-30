import 'package:flutter/material.dart';
import 'package:sims_ppob_abim/feature/payment/domain/entity/payment.dart';
import 'package:sims_ppob_abim/feature/payment/domain/usecase/payment_usecase.dart';

class PaymentProviders with ChangeNotifier {
  final PaymentUsecase paymentUsecase;

  PaymentProviders({required this.paymentUsecase});

  bool _isLoading = false;
  String? _errorMessage = '';
  Payment? _payment = Payment(
    invoiceNumber: '',
    transactionType: '',
    serviceName: '',
    serviceCode: '',
    totalAmount: 0,
    createdOn: DateTime.now(),
  );

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  Payment? get payment => _payment;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setErrorMessage(String? value) {
    _errorMessage = value;
    notifyListeners();
  }

  Future<void> getPayment(
      String transactionType, String serviceCode, int amount) async {
    _setLoading(true);
    setErrorMessage(null);
    try {
      final response =
          await paymentUsecase.getPayment(transactionType, serviceCode, amount);
      response.fold(
        (l) {
          debugPrint('Error: $l');
          setErrorMessage(l.message);
        },
        (r) {
          _payment = r.data;
          debugPrint('Success: $r');
        },
      );
      _setLoading(false);
    } finally {
      _setLoading(false);
    }
  }
}
