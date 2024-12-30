import 'package:sims_ppob_abim/core/services/local_database/secure_storage.dart';

class SecureHeaders {
  static Future<Map<String, String>> getHeaders() async {
    final token = await SecureStorage().read('token');
    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
  }
}
