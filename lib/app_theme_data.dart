import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppThemeData {
  static ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: AppColors.primary_light,
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.blue_color,
    iconTheme: IconThemeData(
      size: 35,
      // fill: ,
      color: AppColors.white_color
    )),
    bottomAppBarTheme: BottomAppBarTheme(
      padding: EdgeInsets.all(0),
      shape: CircularNotchedRectangle(),
      color: AppColors.white_color
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

    cardTheme: CardTheme(
      color: AppColors.white_color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 50,
      shadowColor: AppColors.gray_color1,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 15,
        backgroundColor: AppColors.blue_color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        iconSize: 30,
        iconColor: AppColors.white_color
      ),

    ),

    bottomSheetTheme:BottomSheetThemeData(
      backgroundColor: AppColors.white_color
    ),


    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        color: AppColors.white_color,
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),

      titleMedium: GoogleFonts.poppins(
        fontSize: 25,
        fontWeight: FontWeight.w700,
        color: AppColors.gray_color1,
      ),

      titleSmall: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.gray_color4,
      ),



      displaySmall: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.gray_color1
      ),

      displayMedium: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.green_color
    ),)

  );

  static ThemeData darkMode =  ThemeData(
      scaffoldBackgroundColor: AppColors.primary_dark,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.blue_color,
      iconTheme: IconThemeData(
         color: AppColors.primary_dark,
        // fill: 70,
        size: 30
      )),
      bottomAppBarTheme: BottomAppBarTheme(
        padding: EdgeInsets.all(0),
        shape: CircularNotchedRectangle(),
        color: AppColors.secondry_dark
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
          side: BorderSide(color: AppColors.secondry_dark, width: 4),
        ),
        iconSize: 35,
      ),

      cardTheme: CardTheme(
        color: AppColors.secondry_dark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 40,
        shadowColor: AppColors.blue_color,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: 15,
            backgroundColor: AppColors.blue_color,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            iconSize: 30,
            iconColor: AppColors.white_color
        ),

      ),

      bottomSheetTheme:BottomSheetThemeData(
          backgroundColor: AppColors.secondry_dark
      ),



      textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
          color: AppColors.primary_dark,
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),

        titleMedium: GoogleFonts.poppins(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          color: AppColors.white_color,
        ),

        titleSmall: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.white_color,
        ),

        displaySmall: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColors.white_color
        ),



        displayMedium: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.green_color
        ),)

  );
}
