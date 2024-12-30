import 'package:sims_ppob_abim/feature/auth/domain/entity/jwt_token.dart';

class AuthResponseModel {
  final int status;
  final String message;
  final JwtToken? data;

  AuthResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? JwtToken.fromJson(
              json['data'],
            )
          : null,
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
