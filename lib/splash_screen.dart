import 'package:flutter/material.dart';
import 'app_colors.dart';

class SplashScreen extends StatefulWidget {
  static const String route_name="splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // @override
  // void initState() {
  //
  //   super.initState();
  // }
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
