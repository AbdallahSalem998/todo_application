import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class MyThemeData {

  static ThemeData lightTheme = ThemeData(
      primaryColor: lightColor,
      scaffoldBackgroundColor: lightGreenColor,
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        bodyMedium: GoogleFonts.poppins(
            fontSize: 18, fontWeight: FontWeight.w600, color: lightColor),
        bodySmall: GoogleFonts.roboto(
            fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black54),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey.shade400,
        selectedItemColor: lightColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: lightColor,
        iconTheme: IconThemeData(color: Colors.black54, size: 30),
      ));
  static ThemeData darkTheme = ThemeData(
      primaryColor: darkcolorT,
      scaffoldBackgroundColor: darkColor,
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(
            fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF060E1E)),
        bodyMedium: GoogleFonts.poppins(
            fontSize: 18, fontWeight: FontWeight.w600, color: darkcolorT),
        bodySmall: GoogleFonts.roboto(
            fontSize: 15, fontWeight: FontWeight.normal, color: yellowColor),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF141922),
        unselectedItemColor: Colors.white,
        selectedItemColor: darkcolorT,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: lightColor,
        iconTheme: IconThemeData(color: Colors.black54, size: 30),
      ));
}
