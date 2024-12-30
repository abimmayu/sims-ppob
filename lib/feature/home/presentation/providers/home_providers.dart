import 'package:flutter/material.dart';
import 'package:sims_ppob_abim/feature/home/domain/entitiy/banner.dart';
import 'package:sims_ppob_abim/feature/home/domain/entitiy/services.dart';
import 'package:sims_ppob_abim/feature/home/domain/usecases/banner_usecase.dart';
import 'package:sims_ppob_abim/feature/home/domain/usecases/services_usecase.dart';

class HomeProviders with ChangeNotifier {
  final BannerUsecase bannerUsecase;
  final ServicesUsecase servicesUsecase;

  HomeProviders(
    this.bannerUsecase,
    this.servicesUsecase,
  );

  bool _isLoading = false;
  List<MyBanner> _banners = [];
  final List<Services> _services = [];

  bool get isLoading => _isLoading;
  List<MyBanner> get banners => _banners;
  List<Services> get services => _services;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getBanner() async {
    _setLoading(true);
    final response = await bannerUsecase.getBanner();
    response.fold(
      (l) {
        debugPrint('Error: $l');
      },
      (r) {
        _banners = r.data;
      },
    );
    _setLoading(false);
  }

  Future<void> getServices() async {
    _setLoading(true);
    final response = await servicesUsecase.getServices();
    response.fold(
      (l) {
        debugPrint('Error: $l');
      },
      (r) {
        _services.addAll(r.data);
      },
    );
    _setLoading(false);
  }
}
