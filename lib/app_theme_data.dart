import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppThemeData {
  static ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: AppColors.primary_light,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.blue_color),
    bottomAppBarTheme: BottomAppBarTheme(
      padding: EdgeInsets.all(0),
      shape: CircularNotchedRectangle(),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedItemColor: AppColors.blue_color,
      unselectedItemColor: AppColors.gray_color4,
      selectedIconTheme: IconThemeData(size: 30),
      unselectedIconTheme: IconThemeData(size: 30),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.blue_color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: AppColors.white_color, width: 2),
      ),
      iconSize: 35,
    ),

    textTheme: TextTheme(
      titleLarge:  GoogleFonts.poppins(
        color: AppColors.white_color,
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
    )
  );
  static ThemeData darkMode = ThemeData();
}
