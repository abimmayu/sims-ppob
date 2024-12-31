import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sims_ppob_abim/core/error/failure.dart';
import 'package:sims_ppob_abim/feature/home/data/models/response/banner_response.dart';
import 'package:sims_ppob_abim/feature/home/data/models/response/services_response.dart';
import 'package:sims_ppob_abim/feature/home/domain/entitiy/banner.dart';
import 'package:sims_ppob_abim/feature/home/domain/entitiy/services.dart';
import 'package:sims_ppob_abim/feature/home/domain/usecases/banner_usecase.dart';
import 'package:sims_ppob_abim/feature/home/domain/usecases/services_usecase.dart';

class HomeProviders with ChangeNotifier {
  final BannerUsecase bannerUsecase;
  final ServicesUsecase servicesUsecase;

  HomeProviders(this.bannerUsecase, this.servicesUsecase);

  bool _isLoading = false;
  List<MyBanner> _banners = [];
  List<Services> _services = [];

  bool get isLoading => _isLoading;
  List<MyBanner> get banners => _banners;
  List<Services> get services => _services;

  void _updateState({
    bool? isLoading,
    List<MyBanner>? banners,
    List<Services>? services,
  }) {
    if (isLoading != null) _isLoading = isLoading;
    if (banners != null) _banners = banners;
    if (services != null) _services = services;
    notifyListeners();
  }

  Future<void> _fetchData<T>(
    Future<Either<Failure, dynamic>> Function() fetchFunction,
    void Function(T data) onSuccess,
  ) async {
    _updateState(isLoading: true);
    try {
      final response = await fetchFunction();
      response.fold(
        (failure) => debugPrint('Error: ${failure.message}'),
        (success) => onSuccess(success),
      );
    } catch (e) {
      debugPrint('Unexpected Error: $e');
    } finally {
      _updateState(isLoading: false);
    }
  }

  Future<void> getBanner() async {
    await _fetchData(
      bannerUsecase.getBanner,
      (data) {
        if (data is BannerResponse) _updateState(banners: data.data);
      },
    );
  }

  Future<void> getServices() async {
    await _fetchData(
      servicesUsecase.getServices,
      (data) {
        if (data is ServicesResponse) {
          _updateState(
            services: data.data,
          );
        }
      },
    );
  }
}
