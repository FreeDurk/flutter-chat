import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  final Dio dio;

  ApiClient(String? accessToken)
    : dio = Dio(
        BaseOptions(
          baseUrl: dotenv.get('API_URL'),
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {
              'Content-Type': 'application/json',
              if (accessToken != null)
                'Authorization': 'Bearer $accessToken',
            },
        ),
      ) {
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  Dio get client => dio;
}
