import 'package:sims_ppob_abim/feature/home/domain/entitiy/services.dart';

class ServicesResponse {
  final int status;
  final String message;
  final List<Services> data;

  ServicesResponse(
      {required this.status, required this.message, required this.data});

  factory ServicesResponse.fromJson(Map<String, dynamic> json) {
    return ServicesResponse(
      status: json['status'],
      message: json['message'],
      data: List<Services>.from(json['data'].map((x) => Services.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statis': status,
      'message': message,
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}
