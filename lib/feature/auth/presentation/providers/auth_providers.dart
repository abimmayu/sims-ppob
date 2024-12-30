import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sims_ppob_abim/core/services/local_database/secure_storage.dart';
import 'package:sims_ppob_abim/feature/auth/domain/entity/jwt_token.dart';
import 'package:sims_ppob_abim/feature/auth/domain/usecase/login_usecase.dart';
import 'package:sims_ppob_abim/feature/auth/domain/usecase/registration_usecase.dart';

class AuthProvider with ChangeNotifier {
  final LoginUsecase loginUseCase;
  final RegistrationUsecase registerUseCase;
  final SecureStorage secureStorage;

  AuthProvider(
    this.loginUseCase,
    this.registerUseCase,
    this.secureStorage,
  );

  JwtToken? _token;
  bool _isLoading = false;
  String? _errorMessage = '';
  final GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyRegister = GlobalKey<FormState>();

  JwtToken? get token => _token;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  GlobalKey<FormState> get formKeyLogin => _formKeyLogin;
  GlobalKey<FormState> get formKeyRegister => _formKeyRegister;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setErrorMessage(String? value) {
    _errorMessage = value;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    _setLoading(true);
    setErrorMessage(null);
    try {
      final response = await loginUseCase.login(email, password);
      log("response: $response");
      response.fold(
        (l) {
          debugPrint('Error: $l');
          setErrorMessage(l.message);
        },
        (r) {
          secureStorage.write(
            'token',
            r.data?.token ?? '',
          );
          _token = r.data;
        },
      );
      _setLoading(false);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> register(
    String email,
    String firstName,
    String lastName,
    String password,
  ) async {
    _setLoading(true);
    setErrorMessage(null);
    try {
      final response = await registerUseCase.register(
        email,
        firstName,
        lastName,
        password,
      );
      response.fold(
        (l) {
          debugPrint('Error: $l');
          setErrorMessage(l.message);
        },
        (r) => _token = r.data,
      );
      _setLoading(false);
    } finally {
      _setLoading(false);
    }
  }
}
