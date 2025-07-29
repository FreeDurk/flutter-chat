import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/core/providers/token_notifier.dart';
import 'package:mchat/features/auth/data/services/auth_service.dart';
import 'package:mchat/features/auth/data/dto/login_request.dart';

final loginStateProvider = StateProvider<AsyncValue<dynamic>>((ref) {
  return const AsyncValue.data(null);
});

final loginActionProvider = Provider((ref) {
  return (LoginRequest request) async {
    ref.read(loginStateProvider.notifier).state = const AsyncValue.loading();
    
    try {
      final result = await ref.read(authServiceProvider).login(request);
      await ref.read(tokenNotifierProvider.notifier).saveToken(result);
      ref.read(loginStateProvider.notifier).state = AsyncValue.data(result);
    } catch (e, st) {
      debugPrint(e.toString());
      ref.read(loginStateProvider.notifier).state = AsyncValue.error(e, st);
    }
  };
});
