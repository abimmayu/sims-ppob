class PaymentRequest {
  final String transactionType;
  final String serviceCode;
  final int totalAmount;

  PaymentRequest(
    this.transactionType,
    this.serviceCode,
    this.totalAmount,
  );

  Map<String, dynamic> toJson() {
    return {
      'transaction_type': transactionType,
      'service_code': serviceCode,
      'total_amount': totalAmount,
    };
  }

  factory PaymentRequest.fromJson(Map<String, dynamic> json) {
    return PaymentRequest(
      json['transaction_type'],
      json['service_code'],
      json['total_amount'],
    );
  }
}
