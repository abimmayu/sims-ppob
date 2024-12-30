import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // Write to secure storage
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<void> write(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  // Read from secure storage
  Future<String?> read(String key) async {
    return await storage.read(key: key);
  }

  // Delete from secure storage
  Future<void> delete(String key) async {
    await storage.delete(key: key);
  }
}
