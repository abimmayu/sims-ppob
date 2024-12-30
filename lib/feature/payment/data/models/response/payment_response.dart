import 'package:sims_ppob_abim/feature/payment/domain/entity/payment.dart';

class PaymentResponse {
  final int status;
  final String message;
  final Payment? data;

  PaymentResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory PaymentResponse.fromJson(Map<String, dynamic> json) {
    return PaymentResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? Payment.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}
