import 'package:dartz/dartz.dart';
import 'package:sims_ppob_abim/core/error/failure.dart';
import 'package:sims_ppob_abim/core/error/module_information_error.dart';
import 'package:sims_ppob_abim/feature/home/data/datasources/home_datasource.dart';
import 'package:sims_ppob_abim/feature/home/data/models/response/banner_response.dart';
import 'package:sims_ppob_abim/feature/home/data/models/response/services_response.dart';
import 'package:sims_ppob_abim/feature/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource homeDatasource;

  HomeRepositoryImpl({required this.homeDatasource});

  @override
  Future<Either<Failure, BannerResponse>> getBanner() async {
    try {
      final result = await homeDatasource.getBanner();
      return Right(result);
    } catch (e) {
      return Left(BannerError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ServicesResponse>> getServices() async {
    try {
      final result = await homeDatasource.getServices();
      return Right(result);
    } catch (e) {
      return Left(BannerError(message: e.toString()));
    }
  }
}
