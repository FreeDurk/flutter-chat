import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient(String? accessToken)
    : dio = Dio(
        BaseOptions(
          baseUrl: 'https://0868d6be6b34.ngrok-free.app/v1',
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
