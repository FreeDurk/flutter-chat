import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/models/user_model.dart';

final userStateProvider = StateProvider<AsyncValue<UserModel>>((ref) {
  return AsyncValue.data(
    UserModel(id: '', name: '', email: '', contact: '', avatar: ''),
  );
});
