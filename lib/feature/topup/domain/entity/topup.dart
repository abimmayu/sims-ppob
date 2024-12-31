class Topup {
  final int balance;

  Topup({required this.balance});

  factory Topup.fromJson(Map<String, dynamic> json) {
    return Topup(
      balance: json["balance"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "balance": balance,
    };
  }
}
