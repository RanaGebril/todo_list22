import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier{
  ThemeMode AppTheme=ThemeMode.light;

   changeTheme(ThemeMode theme){
     // Obtain shared preferences.
     // final SharedPreferences prefs = await SharedPreferences.getInstance();
     AppTheme=theme;
     notifyListeners();
   }


}