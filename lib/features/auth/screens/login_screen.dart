// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mchat/features/auth/data/dto/login_request.dart';
import 'package:mchat/features/auth/screens/widgets/input_field.dart';
import 'package:mchat/features/auth/screens/widgets/login_btn.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   backgroundColor: const Color(0xFF1E1F29),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Container(
            height: 412,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white38,
            ),
            child: Column(
              children: [
                InputField(
                  title: 'Email',
                  placeholder: 'Enter email',
                  isPassword: false,
                  onChanged: null,
                  controller: _email,
                ),
                SizedBox(height: 14),
                InputField(
                  title: 'Password',
                  placeholder: 'Enter password',
                  isPassword: true,
                  onChanged: null,
                  controller: _password,
                ),
                LoginBtn(text: 'Log In', email: _email, password: _password),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
