import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:sims_ppob_abim/core/constant/app_url.dart';
import 'package:sims_ppob_abim/core/utils/headers/secure_headers.dart';

class DioService {
  final Dio dio;
  final Logger logger = Logger();

  DioService(this.dio);

  void init() {
    dio.options
      ..baseUrl = AppUrl.baseUrl
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10)
      ..validateStatus = (status) => status! < 500;
  }

  Future<Response> request(
    String method,
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    FormData? formData,
  }) async {
    final getHeaders = headers ?? await SecureHeaders.getHeaders();
    logger.i('Request $method: $url');
    logger.i('Data: $data');
    final request = await dio.request(
      url,
      data: formData ?? data,
      options: Options(
        method: method,
        headers: getHeaders,
      ),
    );
    logger.d(request.data);
    return request;
  }

  Future<Response> get(String url, {Map<String, dynamic>? headers}) =>
      request('GET', url, headers: headers);

  Future<Response> post(String url, Map<String, dynamic> data,
          {Map<String, dynamic>? headers}) =>
      request('POST', url, data: data, headers: headers);

  Future<Response> put(String url, Map<String, dynamic> data,
          {Map<String, dynamic>? headers}) =>
      request('PUT', url, data: data, headers: headers);

  /// Upload File
  Future<Response> uploadFile(
    String url, {
    required String filePath,
    String fileKey = 'file',
    Map<String, dynamic>? additionalData,
    Map<String, dynamic>? headers,
  }) async {
    final formData = FormData.fromMap({
      ...?additionalData,
      fileKey: await MultipartFile.fromFile(filePath),
    });

    return await request(
      'POST',
      url,
      formData: formData,
      headers: headers,
    );
  }

  void dispose() => dio.close();
}
