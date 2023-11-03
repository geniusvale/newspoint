import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(
  fontFamily: GoogleFonts.lato().fontFamily,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
  textTheme: TextTheme(
    titleMedium: GoogleFonts.merriweather(fontWeight: FontWeight.w700),
    bodyLarge: GoogleFonts.lato(fontWeight: FontWeight.w700, fontSize: 48),
  ),
);
