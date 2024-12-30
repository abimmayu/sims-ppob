import 'package:dartz/dartz.dart';
import 'package:sims_ppob_abim/core/error/failure.dart';
import 'package:sims_ppob_abim/feature/auth/data/models/response/auth_response_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponseModel>> login(
    String email,
    String password,
  );
  Future<Either<Failure, AuthResponseModel>> register(
    String email,
    String firstName,
    String lastName,
    String password,
  );
}
