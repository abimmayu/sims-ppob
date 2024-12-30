class AppUrl {
  // Base Url
  static const String baseUrl =
      'https://take-home-test-api.nutech-integrasi.com';

  // Authentication
  static const String login = '/login';
  static const String registration = '/registration';
  static const String profile = '/profile';
  static const String updateProfile = '$profile/update';
  static const String changePassword = '$profile/image';

  // Module information
  static const String banner = '/banner';
  static const String services = '/services';

  // Module transaction
  static const String balance = '/balance';
  static const String topUp = '/topup';
  static const String transaction = '/transaction';
  static const String history = '$transaction/history';
}
