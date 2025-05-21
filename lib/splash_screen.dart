import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list22/home_screen.dart';
import 'package:todo_list22/providers/app_provider.dart';
import 'package:todo_list22/register/log_in.dart';
import 'app_colors.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  static const String route_name = "splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    var provider_object = Provider.of<AppProvider>(context, listen: false);
    Timer(Duration(seconds: 3), () {
      provider_object.firebaseUser != null
          ? Navigator.pushReplacementNamed(context, HomeScreen.route_name)
          : Navigator.pushReplacementNamed(context, LogIn.route_name);
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider_object = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor:
          provider_object.AppTheme == ThemeMode.light
              ? AppColors.primary_light
              : AppColors.primary_dark,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 138),
          Image.asset("assets/images/logo.png"),
          Image.asset("assets/images/pranding.png"),
        ],
      ),
    );
  }
}
