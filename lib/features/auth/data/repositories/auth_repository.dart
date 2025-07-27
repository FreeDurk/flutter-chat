import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      ref.read(loginStateProvider.notifier).state = AsyncValue.data(result);
    } catch (e, st) {
      ref.read(loginStateProvider.notifier).state = AsyncValue.error(e, st);
    }
  };
});
