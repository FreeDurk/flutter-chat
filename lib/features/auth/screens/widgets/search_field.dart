import 'package:flutter/material.dart';
import 'package:mchat/core/providers/theme_provider.dart';

class SearchField extends StatefulWidget {
  final String title;
  final String placeholder;
  final Function(String)? onChanged;
  final TextEditingController controller;
  const SearchField({
    required this.title,
    required this.placeholder,
    required this.onChanged,
    required this.controller,
    super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.w800, color: blk),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: widget.controller,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            // filled: true,
            // fillColor: greyOpacity,
            focusedBorder: outlineBorder,
            enabledBorder: outlineBorder,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
            hintText: widget.placeholder,
            hintStyle: const TextStyle(fontSize: 14),
            suffixIcon: IconButton(
              onPressed: () => print('hello'),
              icon: Icon(
                Icons.search,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
