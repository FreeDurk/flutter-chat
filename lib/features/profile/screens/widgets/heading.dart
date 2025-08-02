import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Row heading(WidgetRef ref) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 10), // Spacing between avatar and name
          const Text(
            'Matthew',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
      Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.grey[200],
        ),
        child: Center(
          child: Image.asset(
            'assets/images/profile_edit.png',
            height: 14,
            width: 14,
            color: Colors.black,
          ),
        ),
      ),
    ],
  );
}
