import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list22/app_colors.dart';
import 'package:todo_list22/firebaseFunctions.dart';
import 'package:todo_list22/home_screen.dart';
import 'package:todo_list22/providers/app_provider.dart';
import 'package:todo_list22/register/sign_up.dart';
import 'package:todo_list22/text_form/text_form_item.dart';

class LogIn extends StatelessWidget {
  static const String route_name = "log_in";
  LogIn({super.key});
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider_opject = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("logIn".tr(), style: TextTheme.of(context).titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormItem(
                label: "email".tr(),
                controller: emailController,
                type: TextInputType.emailAddress,
                // validation: (emailController) {
                //   if(emailController == null || emailController.isEmpty){
                //     return"Email is required";
                //   }
                //   if( emailController != FirebaseAuth.instance.currentUser?.email){
                //     return"Incorrect email";
                //   }
                //   return null;
                //
                // },
              ),
              SizedBox(height: 25),
              TextFormItem(
                label: "password".tr(),
                controller: passwordController,
                type: TextInputType.text,
                // validation: (passwordController) {
                //   if(passwordController==null || passwordController.isEmpty){
                //     return"password is required";
                //   }
                // },
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    Firebasefunctions.signIn(
                      email: emailController.text,
                      password: passwordController.text,
                      onSucess: () {
                        provider_opject.initUser().then(
                              (value) => Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomeScreen.route_name,
                                (route) => false,
                          ),
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
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "logIn".tr(),
                    style: TextTheme.of(
                      context,
                    ).titleSmall?.copyWith(color: AppColors.white_color),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () => Navigator.pushNamed(context, Signup.route_name),
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
