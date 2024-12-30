import 'package:sims_ppob_abim/core/error/failure.dart';

class HomeError implements Failure {
  @override
  final String title;
  @override
  final String message;

  HomeError({
    this.title = "Error get Data!",
    this.message = "An error occurred",
  });

  @override
  String toString() => message;
}

class BannerError extends HomeError {
  BannerError({
    super.message = 'Error get Banner',
    super.title = 'Banner Error',
  });
}

class ServicesError extends HomeError {
  ServicesError({
    super.message = 'Error get Services',
    super.title = 'Services Error',
  });
}
