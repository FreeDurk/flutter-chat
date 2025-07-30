import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mchat/features/auth/screens/login_screen.dart';
import 'package:mchat/features/dashboard/screens/main_screen.dart';
import 'package:mchat/features/contact/screens/contact_screen.dart';

final List<GoRoute> appRouter = [
  GoRoute(
    name: 'login',
    path: '/',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: const LoginScreen(),
      transitionsBuilder: _slideFromRight,
    ),
  ),
  GoRoute(
    name: 'dashboard',
    path: '/dashboard',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: const MainScreen(),
      transitionsBuilder: _slideFromRight,
    ),
  ),
  GoRoute(
    name: 'profile',
    path: '/profile',
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: const ContactScreen(),
      transitionsBuilder: _slideFromRight,
    ),
  ),
];


Widget _slideFromRight(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return SlideTransition(
    position: Tween<Offset>(
      begin: const Offset(1.0, 0.0), 
      end: Offset.zero,
    ).animate(animation),
    child: child,
  );
}
