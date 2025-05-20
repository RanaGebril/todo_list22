import 'package:flutter/material.dart';
import 'package:todo_list22/home_screen.dart';
import 'app_colors.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  static const String route_name="splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
        Navigator.pushReplacementNamed(context, HomeScreen.route_name);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary_light,
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,

          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 138,
            ),
            Image.asset("assets/images/logo.png"),
            Image.asset("assets/images/pranding.png")
          ],
        )
    );
  }
}
