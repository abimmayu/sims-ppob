class TopupRequest {
  final int balance;

  TopupRequest({required this.balance});

  factory TopupRequest.fromJson(Map<String, dynamic> json) {
    return TopupRequest(
      balance: json['balance'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'top_up_amount': balance,
    };
  }
}
