import 'package:sims_ppob_abim/feature/history/domain/entity/histories.dart';

class HistoryResponse {
  final int status;
  final String message;
  final Histories data;

  HistoryResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HistoryResponse.fromJson(Map<String, dynamic> json) {
    return HistoryResponse(
      status: json['status'],
      message: json['message'],
      data: Histories.fromJson(
        json['data'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
      "data": data.toJson(),
    };
  }
}
