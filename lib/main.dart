import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/core/providers/theme_provider.dart';
import 'package:mchat/features/auth/screens/login_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = ref.watch(themeProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const LoginScreen(),
    );
  }
}
