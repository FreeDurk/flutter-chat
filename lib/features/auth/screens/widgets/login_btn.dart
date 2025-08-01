import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/core/providers/theme_provider.dart';
import 'package:mchat/features/auth/data/dto/login_request.dart';
import 'package:mchat/features/auth/data/repositories/auth_repository.dart';
import 'package:mchat/features/dashboard/providers/user_provider.dart';

class LoginBtn extends ConsumerWidget {
  final String text;
  final TextEditingController email;
  final TextEditingController password;
  const LoginBtn({
    required this.text,
    required this.email,
    required this.password,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(userStateProvider);
    return InkWell(
      onTap: () async {
        ref.read(loginActionProvider)(
          LoginRequest(email: email.text, password: password.text),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            loginState.when(
              data: (result) =>
                  Text(text, style: Theme.of(context).textTheme.bodyMedium),
              error: (error, stackTrace) {
                print('Login error: $error');
                print('StackTrace: $stackTrace');
                return Text(
                  "Login failed",
                  style: TextStyle(color: Colors.red),
                );
              },
              loading: () => const Padding(
                padding: EdgeInsets.only(left: 8),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
