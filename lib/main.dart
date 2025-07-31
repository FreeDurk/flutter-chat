import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mchat/core/providers/theme_provider.dart';
import 'package:mchat/core/providers/token_notifier.dart';
import 'package:mchat/core/router/router.dart';
import 'package:mchat/features/auth/screens/login_screen.dart';

Future<void>  main() async {
  await dotenv.load(fileName: '.env');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = ref.watch(themeProvider);
    final tokenState = ref.watch(tokenNotifierProvider);

    return tokenState.when(
      data: (token) {
        final GoRouter guardedRouter = GoRouter(
          initialLocation: token == null ? '/' : '/dashboard',
          routes: appRouter,
        );

        return MaterialApp.router(routerConfig: guardedRouter, theme: theme);
      },
      error: (error, stackTrace) {
        return MaterialApp(theme: theme, home: LoginScreen());
      },
      loading: () => MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/mchat.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
