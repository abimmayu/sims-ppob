import 'package:sims_ppob_abim/core/constant/app_url.dart';
import 'package:sims_ppob_abim/core/services/api_services/dio.dart';
import 'package:sims_ppob_abim/feature/auth/data/models/request/login/login_request_model.dart';
import 'package:sims_ppob_abim/feature/auth/data/models/request/register/register_request_model.dart';
import 'package:sims_ppob_abim/feature/auth/data/models/response/auth_response_model.dart';

abstract class AuthLocalDatasource {
  Future<AuthResponseModel> login(String email, String password);
  Future<AuthResponseModel> register(
      String email, String firstName, String lastName, String password);
}

class AuthLocalDatasourceImpl extends AuthLocalDatasource {
  final DioService dioService;

  AuthLocalDatasourceImpl(this.dioService);

  @override
  Future<AuthResponseModel> login(
    String email,
    String password,
  ) async {
    final response = await dioService.post(
      AppUrl.login,
      LoginRequestModel(
        email: email,
        password: password,
      ).toJson(),
    );
    return AuthResponseModel.fromJson(response.data);
  }

  @override
  Future<AuthResponseModel> register(
    String email,
    String firstName,
    String lastName,
    String password,
  ) async {
    final response = await dioService.post(
      AppUrl.registration,
      RegisterRequestModel(
        email: email,
        firstName: firstName,
        lastName: lastName,
        password: password,
      ).toJson(),
    );
    return AuthResponseModel.fromJson(response.data);
  }
}
