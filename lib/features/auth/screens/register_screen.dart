// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mchat/features/auth/screens/widgets/footer.dart';
import 'package:mchat/features/auth/screens/widgets/input_field.dart';
import 'package:mchat/features/auth/screens/widgets/register_btn.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF157A9F), // Darker blue
              Color(0xFF3DAABF), // Lighter blue
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 30),
                Row(children: [Image.asset('assets/images/mchat_logo.png')]),
                SizedBox(height: 25),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 16),
                      InputField(
                        title: 'Name',
                        placeholder: 'Enter Name',
                        isPassword: false,
                        onChanged: null,
                        controller: _email,
                      ),
                      SizedBox(height: 25),
                      InputField(
                        title: 'Email',
                        placeholder: 'Enter Email',
                        isPassword: false,
                        onChanged: null,
                        controller: _password,
                      ),
                      SizedBox(height: 25),
                      InputField(
                        title: 'Contact Number',
                        placeholder: 'Enter Contact Number',
                        isPassword: false,
                        onChanged: null,
                        controller: _password,
                      ),
                      SizedBox(height: 25),
                      InputField(
                        title: 'Password',
                        placeholder: 'Enter password',
                        isPassword: true,
                        onChanged: null,
                        controller: _password,
                      ),
                      SizedBox(height: 25),
                      RegisterBtn(email: _email, password: _password),
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () => context.goNamed('login'),
                        child: Text(
                          "Already have an account? Sign In",
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      footer
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
