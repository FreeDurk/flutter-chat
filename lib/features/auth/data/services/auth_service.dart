import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/core/providers/dio_provider.dart';
import 'package:mchat/features/auth/data/dto/login_request.dart';

class AuthService {
  final Dio dio;

  AuthService(this.dio); 

  Future login(LoginRequest request) async {
    try {
      // dio.post(path)
    } catch (dio) {
      // 
    }
    return true;
  }
}

final authServiceProvider = Provider((ref) => AuthService(ref.read(dioProvider)));