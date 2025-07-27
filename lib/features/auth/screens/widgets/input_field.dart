import 'package:flutter/material.dart';
import 'package:mchat/core/providers/theme_provider.dart';

class InputField extends StatefulWidget {
  final String title;
  final String placeholder;
  final bool isPassword;
  final Function(String)? onChanged;
  final TextEditingController controller;
  const InputField({
    required this.title,
    required this.placeholder,
    required this.isPassword,
    required this.onChanged,
    required this.controller,
    super.key,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: blk,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          obscureText: widget.isPassword,
          style: const TextStyle(
            fontSize: 14,
          ),
          decoration: InputDecoration(
            // filled: true,
            // fillColor: greyOpacity,
            focusedBorder: outlineBorder,
            enabledBorder: outlineBorder,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
            hintText: widget.placeholder,
            hintStyle: const TextStyle(fontSize: 14),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () => print('hello'),
                    icon: Icon(
                      Icons.visibility,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : const SizedBox(),
          ),
        ),
      ],
    );
  }
}
