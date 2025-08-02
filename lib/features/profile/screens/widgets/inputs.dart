import 'package:flutter/material.dart';

Row profileInputs({required String label, required String hint}) {
  return Row(
    children: [
      SizedBox(
        width: 100,
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ),
      Expanded(
        child: TextField(
          style: const TextStyle(fontSize: 14, color: Colors.grey),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 14),
          ),
        ),
      ),
    ],
  );
}
