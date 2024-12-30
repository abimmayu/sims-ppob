import 'package:sims_ppob_abim/core/error/failure.dart';

class ModuleInformationError implements Failure {
  @override
  final String message;
  @override
  final String title;

  ModuleInformationError({
    required this.title,
    this.message = 'An error occurred',
  });

  @override
  String toString() {
    return message;
  }
}

class BannerError extends ModuleInformationError {
  BannerError({
    super.message = 'Banner failed',
    super.title = 'Banner Error',
  });
}

class ServiceError extends ModuleInformationError {
  ServiceError({
    super.message = 'Service failed',
    super.title = 'Service Error',
  });
}
