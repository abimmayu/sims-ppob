import 'package:dartz/dartz.dart';
import 'package:sims_ppob_abim/core/error/failure.dart';
import 'package:sims_ppob_abim/feature/auth/data/models/response/auth_response_model.dart';
import 'package:sims_ppob_abim/feature/auth/domain/repository/auth_repository.dart';

class RegistrationUsecase {
  final AuthRepository _authRepository;

  RegistrationUsecase(this._authRepository);

  Future<Either<Failure, AuthResponseModel>> register(
      String email, String firstName, String lastName, String password) async {
    return await _authRepository.register(
      email,
      firstName,
      lastName,
      password,
    );
  }
}
