import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list22/firebaseFunctions.dart';
import 'package:todo_list22/models/user_model.dart';

class AppProvider extends ChangeNotifier{
  ThemeMode AppTheme=ThemeMode.light;
  UserModel? userModel;
  User? firebaseUser; // get logged in user data from firebase to store it in user model


  AppProvider(){
    getTheme();
    firebaseUser=FirebaseAuth.instance.currentUser;
    if (firebaseUser != null){ //if null no logged in user
      initUser();
      notifyListeners();
    }
  }

  Future<void> initUser() async{
     userModel= await Firebasefunctions.getUserData();
     print("UserModel loaded: ${userModel?.firstName}");
     notifyListeners();
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