import 'package:sims_ppob_abim/core/error/failure.dart';

class AuthError implements Failure {
  @override
  final String message;
  @override
  final String title;

  AuthError({
    this.title = "Authentication Error!",
    this.message = 'An error occurred',
  });

  @override
  String toString() {
    return message;
  }
}

class LoginError extends AuthError {
  LoginError({
    super.message = 'Login failed',
    super.title = 'Login Error',
  });
}

class RegistrationError extends AuthError {
  RegistrationError({
    super.message = 'Registration failed',
    super.title = 'Registration Error',
  });
}

class ProfileError extends AuthError {
  ProfileError({
    super.message = 'Profile failed',
    super.title = 'Profile Error',
  });
}

class UpdateProfileError extends AuthError {
  UpdateProfileError({
    super.message = 'Update profile failed',
    super.title = 'Update Profile Error',
  });
}

class UploadPhotoError extends AuthError {
  UploadPhotoError({
    super.message = 'Upload photo failed',
    super.title = 'Upload photo Error',
  });
}
