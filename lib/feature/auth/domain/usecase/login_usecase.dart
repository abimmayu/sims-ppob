import 'package:dartz/dartz.dart';
import 'package:sims_ppob_abim/core/error/failure.dart';
import 'package:sims_ppob_abim/feature/auth/data/models/response/auth_response_model.dart';
import 'package:sims_ppob_abim/feature/auth/domain/repository/auth_repository.dart';

class LoginUsecase {
  final AuthRepository _authRepository;

  LoginUsecase(this._authRepository);

  Future<Either<Failure, AuthResponseModel>> login(
      String email, String password) async {
    return await _authRepository.login(
      email,
      password,
    );
  }
}
