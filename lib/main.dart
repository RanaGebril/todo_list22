
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list22/Taps/Tasks/edit_task.dart';
import 'package:todo_list22/app_theme_data.dart';
import 'package:todo_list22/firebase_options.dart';
import 'package:todo_list22/home_screen.dart';
import 'package:todo_list22/providers/app_provider.dart';
import 'package:todo_list22/register/log_in.dart';
import 'package:todo_list22/register/sign_up.dart';
import 'package:todo_list22/splash_screen.dart';

void main() async{
  // tell the app there is an initialization before runApp
  WidgetsFlutterBinding.ensureInitialized();

  //initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
      ChangeNotifierProvider(
        create: (context) => AppProvider(),
          child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider_opject=Provider.of<AppProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: provider_opject.AppTheme,
      theme: AppThemeData.lightMode,
      darkTheme: AppThemeData.darkMode,
      initialRoute: SplashScreen.route_name,
      routes: {
        SplashScreen.route_name: (context) => SplashScreen(),
        HomeScreen.route_name: (context) => HomeScreen(),
        EditTask.route_name: (context) => EditTask(),
        Signup.route_name: (context) => Signup(),
        LogIn.route_name: (context) => LogIn(),
      },
    );
  }
}

