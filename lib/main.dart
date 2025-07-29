import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/core/providers/theme_provider.dart';
import 'package:mchat/core/providers/token_notifier.dart';
import 'package:mchat/features/auth/screens/login_screen.dart';
import 'package:mchat/features/dashboard/screens/dashboard_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = ref.watch(themeProvider);
    final tokenState = ref.watch(tokenNotifierProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: tokenState.when(
        data: (token) {
          print('Token state data: $token');
          print('Token is null: ${token == null}');
          print('Token isEmpty: ${token?.isEmpty}');
          print('Should go to Dashboard: ${token?.isNotEmpty == true}');
          return (token != null)
              ? DashboardScreen()
              : LoginScreen();
        },
        error: (error, stackTrace) {
          return LoginScreen();
        },
        loading: () =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
      ),
      // home: DashboardScreen(),
    );
  }
}
