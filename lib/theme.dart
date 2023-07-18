import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData homeScreenTheme = ThemeData(
  textTheme: GoogleFonts.signikaNegativeTextTheme(),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFFFD5301),
    primary: const Color(0xFFFD5301),
  ),
  scaffoldBackgroundColor: const Color(0xFFF9F9FA),
  navigationBarTheme: const NavigationBarThemeData(
    elevation: 0,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
    backgroundColor: Colors.transparent,
    indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    indicatorColor: Colors.transparent,
  ),
);

ThemeData onBoardScreenOneTheme = ThemeData(
  textTheme: GoogleFonts.robotoTextTheme(),
);
