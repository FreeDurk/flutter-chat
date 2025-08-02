import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/core/providers/token_notifier.dart';
import 'package:mchat/features/auth/data/services/auth_service.dart';
import 'package:mchat/features/auth/data/dto/login_request.dart';
import 'package:mchat/features/dashboard/providers/user_provider.dart';
import 'package:mchat/models/user_model.dart';

final loginStateProvider = StateProvider<AsyncValue<UserModel>>((ref) {
  return AsyncValue.data(UserModel.fake());
});

final loginActionProvider = Provider((ref) {
  return (LoginRequest request) async {
    ref.read(userStateProvider.notifier).state = const AsyncValue.loading();

    try {
      final result = await ref.read(authServiceProvider).login(request);
      await ref
          .read(tokenNotifierProvider.notifier)
          .saveToken(result['access_token']);
      ref.read(userStateProvider.notifier).state = AsyncValue.data(
        UserModel.fromJson(result['user']),
      );
    } catch (e, st) {
      debugPrint(e.toString());
      ref.read(userStateProvider.notifier).state = AsyncValue.error(e, st);
    }
  };
});
