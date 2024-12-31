import 'package:sims_ppob_abim/feature/topup/domain/entity/topup.dart';

class TopupResponse {
  final int status;
  final String message;
  final Topup? data;

  TopupResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory TopupResponse.fromJson(Map<String, dynamic> json) {
    return TopupResponse(
      status: json["status"],
      message: json['message'],
      data: json['data'] != null
          ? Topup.fromJson(
              json["data"],
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
      "data": data?.toJson(),
    };
  }
}
