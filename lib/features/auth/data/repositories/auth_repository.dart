import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/features/auth/data/services/auth_service.dart';
import 'package:mchat/features/auth/data/dto/login_request.dart';

final loginRequestProvider = FutureProvider.family<dynamic,LoginRequest>((ref , request) {
  return ref.read(authServiceProvider).login(request);
});