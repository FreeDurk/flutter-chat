import 'package:flutter/material.dart';
import 'package:mchat/core/providers/theme_provider.dart';

class LoginBtn extends StatelessWidget {
  final String text;
  final Function() onTap;
  const LoginBtn({required this.text, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
