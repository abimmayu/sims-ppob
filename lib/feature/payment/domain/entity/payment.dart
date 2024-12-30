class Payment {
  final String invoiceNumber;
  final String serviceCode;
  final String serviceName;
  final String transactionType;
  final int totalAmount;
  final DateTime createdOn;

  Payment({
    required this.invoiceNumber,
    required this.serviceCode,
    required this.serviceName,
    required this.transactionType,
    required this.totalAmount,
    required this.createdOn,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      invoiceNumber: json['invoice_number'],
      serviceCode: json['service_code'],
      serviceName: json['service_name'],
      transactionType: json['transaction_type'],
      totalAmount: json['total_amount'],
      createdOn: DateTime.parse(json['created_on']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'invoice_number': invoiceNumber,
      'service_code': serviceCode,
      'service_name': serviceName,
      'transaction_type': transactionType,
      'total_amount': totalAmount,
      'created_on': createdOn.toIso8601String(),
    };
  }
}
