import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/core/providers/dio_provider.dart';
import 'package:mchat/features/auth/data/dto/login_request.dart';

class AuthService {
  final Dio dio;

  AuthService(this.dio);
  Future login(LoginRequest request) async {
    try {
      final response = await dio.post('https://2b2f2e2d073b.ngrok-free.app/v1/login' ,
      data: request.toJson());
      if(response.statusCode == 201){
        return response.data['data']['access_token'];
      }
    } catch (e) {
      return e;
    }
  }
}

final authServiceProvider = Provider(
  (ref) => AuthService(ref.read(dioProvider)),
);
