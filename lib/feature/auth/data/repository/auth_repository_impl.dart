import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sims_ppob_abim/core/error/auth_error.dart';
import 'package:sims_ppob_abim/core/error/failure.dart';
import 'package:sims_ppob_abim/feature/auth/data/datasources/auth_local_datasource.dart';
import 'package:sims_ppob_abim/feature/auth/data/models/response/auth_response_model.dart';
import 'package:sims_ppob_abim/feature/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDatasource authLocalDatasource;
  AuthRepositoryImpl(this.authLocalDatasource);
  @override
  Future<Either<Failure, AuthResponseModel>> login(
      String email, String password) async {
    try {
      final response = await authLocalDatasource.login(email, password);
      final status = response.status;
      if (status == 0) {
        return Right(response);
      } else {
        return Left(
          AuthError(
            message: response.message,
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        AuthError(
          message: e.message!,
        ),
      );
    } catch (e) {
      return Left(
        AuthError(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AuthResponseModel>> register(
    String email,
    String firstName,
    String lastName,
    String password,
  ) async {
    try {
      final response = await authLocalDatasource.register(
        email,
        firstName,
        lastName,
        password,
      );
      final status = response.status;
      if (status == 0) {
        return Right(response);
      } else {
        return Left(
          AuthError(
            message: response.message,
          ),
        );
      }
    } on DioException catch (e) {
      return Left(AuthError(message: e.message!));
    } catch (e) {
      return Left(AuthError(message: e.toString()));
    }
  }
}
