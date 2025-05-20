import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_list22/app_colors.dart';
import 'package:todo_list22/firebaseFunctions.dart';
import 'package:todo_list22/home_screen.dart';
import 'package:todo_list22/text_form/text_form_item.dart';

class LogIn extends StatelessWidget {
  static const String route_name = "log_in";
  LogIn({super.key});
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("logIn".tr(), style: TextTheme.of(context).titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormItem(label: "email".tr(), controller: emailController , type: TextInputType.emailAddress),
            SizedBox(height: 25),
            TextFormItem(label: "password".tr(), controller: passwordController , type: TextInputType.text,),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Firebasefunctions.signIn(
                  email: emailController.text,
                  password: passwordController.text,
                  onSucess: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeScreen.route_name,
                      (route) => false,
                    );
                  },
                  onError: (String message) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("error".tr()),
                          content: Text(message),
                          actions: [
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("back".tr()),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "Login".tr(),
                  style: TextTheme.of(
                    context,
                  ).titleSmall?.copyWith(color: AppColors.white_color),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: "doNotHaveAccount".tr(),
                  style: TextTheme.of(context).displaySmall,
                ),
                TextSpan(
                  text: "signUp".tr(),
                  style: TextTheme.of(
                    context,
                  ).displaySmall?.copyWith(color: AppColors.blue_color),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
