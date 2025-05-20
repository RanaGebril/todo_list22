import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier{
  ThemeMode AppTheme=ThemeMode.light;

  AppProvider(){
    getTheme();
  }

   changeTheme(ThemeMode theme) async{
     AppTheme=theme;

     // Obtain shared preferences.
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // Save an boolean value to 'isDark' key.
      await prefs.setBool('isDark', AppTheme==ThemeMode.dark);

     notifyListeners();
   }

   getTheme()async{
     // Obtain shared preferences.
     final SharedPreferences prefs = await SharedPreferences.getInstance();

     // Try reading data from the 'isDark' key. If it doesn't exist, returns null.
     final bool? isDark = prefs.getBool('isDark');

     // user use the default theme
     if(isDark != null){
        AppTheme = isDark ? ThemeMode.dark : ThemeMode.light;
       notifyListeners(); // Notify listeners after setting the theme
     }
   }


}