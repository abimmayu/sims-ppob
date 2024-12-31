class History {
  final String invoiceNumber;
  final String transactionType;
  final String description;
  final int totalAmount;
  final DateTime createdOn;

  History({
    required this.invoiceNumber,
    required this.transactionType,
    required this.description,
    required this.totalAmount,
    required this.createdOn,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      invoiceNumber: json["invoice_number"],
      transactionType: json["transaction_type"],
      description: json["description"],
      totalAmount: json["total_amount"],
      createdOn: json["created_on"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "invoice_number": invoiceNumber,
      "transaction_type": transactionType,
      "description": description,
      "total_amount": totalAmount,
      "created_on": createdOn,
    };
  }
}
