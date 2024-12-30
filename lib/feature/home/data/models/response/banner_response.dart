import 'package:sims_ppob_abim/feature/home/domain/entitiy/banner.dart';

class BannerResponse {
  final int status;
  final String message;
  final List<MyBanner> data;

  BannerResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BannerResponse.fromJson(Map<String, dynamic> json) {
    return BannerResponse(
      status: json['status'],
      message: json['message'],
      data: List<MyBanner>.from(json['data'].map((x) => MyBanner.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}
