import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list22/app_colors.dart';
import 'package:todo_list22/firebaseFunctions.dart';
import 'package:todo_list22/home_screen.dart';
import 'package:todo_list22/providers/app_provider.dart';
import 'package:todo_list22/text_form/text_form_item.dart';

class Signup extends StatelessWidget {
  static const String route_name = "sign-up";
  Signup({super.key});
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider_object = Provider.of<AppProvider>(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("signUp".tr(), style: TextTheme.of(context).titleLarge),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormItem(
                label: "firstName".tr(),
                controller: firstNameController,
                  type: TextInputType.text
              ),
              SizedBox(height: 30),
              TextFormItem(label: "lastName".tr(), controller: lastNameController,type: TextInputType.text),
              SizedBox(height: 30),
              TextFormItem(label: "Phone".tr(),controller: phoneController, type: TextInputType.phone),
              SizedBox(height: 30),
              TextFormItem(label: "email".tr(), controller: emailController ,type: TextInputType.emailAddress),
              SizedBox(height: 30),
              TextFormItem(label: "password".tr(), controller: passwordController ,type: TextInputType.text),
              SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {
                  Firebasefunctions.createAccount(
                    email: emailController.text,
                    password: passwordController.text,
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    phone: phoneController.text,
                    onSucess: () {
                      provider_object.initUser().then(
                            (value) => Navigator.pushNamedAndRemoveUntil(
                              context,
                              HomeScreen.route_name,
                                  (route) => false,
                            ));

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
                  // Navigator.pushNamed(context, HomeScreen.route_name);
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "signUp".tr(),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: "haveAccount".tr(),
                  style: TextTheme.of(context).displaySmall,
                ),
                TextSpan(
                  text: "logIn".tr(),
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
