import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFFFF6B00);
const Color secondaryColor = Color(0XFFFF3333);

Color blkOpacity = Colors.black.withValues(
  alpha: 0.5,
  blue: 0.5,
  green: 0.5,
  red: 0.5,
);

Color blk = Colors.black;

Color greyOpacity = Colors.grey.shade100;

Color btnColor = Color(0xFF00A6E5);

OutlineInputBorder outlineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: BorderSide(
    color: greyOpacity,
  ),
);

final themeProvider = Provider<ThemeData>((ref) {
  final ThemeData themeData = ThemeData(
    primaryColor: primaryColor,
    fontFamily: GoogleFonts.outfit().fontFamily,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    scaffoldBackgroundColor: const Color(0XFFFFFFFF),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 50,
        color: primaryColor,
        fontWeight: FontWeight.w900,
      ),
      displayMedium: TextStyle(fontSize: 23),
      displaySmall: TextStyle(fontSize: 14),
      titleLarge: TextStyle(fontSize: 36),
      titleMedium: TextStyle(fontSize: 26),
      titleSmall: TextStyle(fontSize: 16),
      bodySmall: TextStyle(fontSize: 10),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(fontSize: 10),
    ),
  );
  return themeData;
});
