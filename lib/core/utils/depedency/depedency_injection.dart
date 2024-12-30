import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sims_ppob_abim/core/services/api_services/dio.dart';
import 'package:sims_ppob_abim/core/services/local_database/secure_storage.dart';
import 'package:sims_ppob_abim/feature/auth/data/datasources/auth_local_datasource.dart';
import 'package:sims_ppob_abim/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:sims_ppob_abim/feature/auth/domain/repository/auth_repository.dart';
import 'package:sims_ppob_abim/feature/auth/domain/usecase/login_usecase.dart';
import 'package:sims_ppob_abim/feature/auth/domain/usecase/registration_usecase.dart';
import 'package:sims_ppob_abim/feature/auth/presentation/providers/auth_providers.dart';
import 'package:sims_ppob_abim/feature/home/data/datasources/home_datasource.dart';
import 'package:sims_ppob_abim/feature/home/data/repository/home_repository_impl.dart';
import 'package:sims_ppob_abim/feature/home/domain/repository/home_repository.dart';
import 'package:sims_ppob_abim/feature/home/domain/usecases/banner_usecase.dart';
import 'package:sims_ppob_abim/feature/home/domain/usecases/services_usecase.dart';
import 'package:sims_ppob_abim/feature/home/presentation/providers/home_providers.dart';
import 'package:sims_ppob_abim/feature/payment/data/datasource/payment_datasource.dart';
import 'package:sims_ppob_abim/feature/payment/data/repository/payment_repository_impl.dart';
import 'package:sims_ppob_abim/feature/payment/domain/repository/payment_respository_impl.dart';
import 'package:sims_ppob_abim/feature/payment/domain/usecase/payment_usecase.dart';
import 'package:sims_ppob_abim/feature/payment/presentation/providers/payment_providers.dart';

final GetIt di = GetIt.instance;

void init() async {
  // Register all dependencies
  await _localStorage();
  await _apiServices();
  await _auth();
  await _home();
  await _payment();
}

Future<void> _localStorage() async {
  di.registerLazySingleton(() => SecureStorage());
}

Future<void> _apiServices() async {
  final Dio dio = Dio();
  final dioService = DioService(dio)..init();
  di.registerLazySingleton(
    () => dioService,
  );
}

Future<void> _auth() async {
  // Datasource
  di.registerLazySingleton<AuthLocalDatasource>(
    () => AuthLocalDatasourceImpl(
      di(),
    ),
  );

  // Repository
  di.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      di(),
    ),
  );

  // Usecase
  di.registerLazySingleton(() => LoginUsecase(di()));
  di.registerLazySingleton(() => RegistrationUsecase(di()));

  // Provider
  di.registerFactory(
    () => AuthProvider(
      di(),
      di(),
      di(),
    ),
  );
}

Future<void> _home() async {
  // Datasource
  di.registerLazySingleton<HomeDatasource>(
    () => HomeDatasourceImpl(
      di(),
    ),
  );

  // Repository
  di.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      homeDatasource: di(),
    ),
  );

  // Usecase
  di.registerLazySingleton(() => BannerUsecase(di()));
  di.registerLazySingleton(() => ServicesUsecase(di()));

  // Provider
  di.registerFactory(
    () => HomeProviders(
      di(),
      di(),
    ),
  );
}

Future<void> _payment() async {
  // Datasource
  di.registerLazySingleton<PaymentDatasource>(
    () => PaymentDatasourceImpl(
      di(),
    ),
  );
  // Repository
  di.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImpl(
      paymentDatasource: di(),
    ),
  );

  // Usecase
  di.registerLazySingleton(
    () => PaymentUsecase(
      paymentRepository: di(),
    ),
  );

  // Provider
  di.registerFactory(
    () => PaymentProviders(
      paymentUsecase: di(),
    ),
  );
}
