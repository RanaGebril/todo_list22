import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier{
  ThemeMode AppTheme=ThemeMode.light;

   changeTheme(ThemeMode theme){
     AppTheme=theme;
     notifyListeners();
   }


}