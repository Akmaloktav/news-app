import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextstyle {
  static TextTheme get _baseTextTheme {
    return TextTheme(
      headlineLarge: GoogleFonts.lato(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        height: 1.25,
        letterSpacing: 0.0,
      ),
      headlineMedium: GoogleFonts.lato(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        height: 1.29,
        letterSpacing: 0.0,
      ),
      headlineSmall: GoogleFonts.lato(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        height: 1.33,
        letterSpacing: 0.0,
      ),
      titleLarge: GoogleFonts.lato(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        height: 1.27,
        letterSpacing: 0.0,
      ),

      titleMedium: GoogleFonts.lato(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.50,
        letterSpacing: 0.15,
      ),
      titleSmall: GoogleFonts.lato(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.43,
        letterSpacing: 0.1,
      ),
      bodyLarge: GoogleFonts.openSans(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.50,
        letterSpacing: 0.5,
      ),
      bodyMedium: GoogleFonts.openSans(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.43,
        letterSpacing: 0.25,
      ),
      labelLarge: GoogleFonts.openSans(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.43,
        letterSpacing: 0.1,
      ),
      labelMedium: GoogleFonts.openSans(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.33,
        letterSpacing: 0.5,
      ),
    );
  }

  static TextTheme get getBaseTextTheme => _baseTextTheme;
}
