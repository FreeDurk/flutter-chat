import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/core/services/secure_storage.dart';
import 'package:mchat/features/dashboard/screens/constants/nav_screens.dart';

final tokenNotifierProvider = AsyncNotifierProvider<TokenNotifier, String?>(() {
  return TokenNotifier();
});

class TokenNotifier extends AsyncNotifier<String?> {
  SecureStorage get _storage => ref.read(secureStorageProvider);

  @override
  Future<String?> build() async {
    return await _storage.getToken();
  }

  Future<void> saveToken(String token) async {
    state = AsyncValue.loading();
    try {
      await _storage.saveToken(token);
      state = AsyncValue.data(token);
    } catch (e, st) {
      state = AsyncValue.error(e.toString(), st);
    }
  }

  Future<void> clearToken() async {
    state = AsyncValue.loading();
    try {
      await _storage.clearToken();
      state = AsyncValue.data(null);
      ref.read(screenStateProvider.notifier).state = 0;
    } catch (e, st) {
      state = AsyncValue.error(e.toString(), st);
    }
  }
}
