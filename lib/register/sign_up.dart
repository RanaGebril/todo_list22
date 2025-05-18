import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list22/app_colors.dart';
import 'package:todo_list22/firebaseFunctions.dart';
import 'package:todo_list22/home_screen.dart';
import 'package:todo_list22/providers/app_provider.dart';
import 'package:todo_list22/register/log_in.dart';
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
        title: Text("Sign Up", style: TextTheme.of(context).titleLarge),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormItem(
                label: "First name",
                controller: firstNameController,
                  type: TextInputType.text
              ),
              SizedBox(height: 30),
              TextFormItem(label: "Last Name", controller: lastNameController,type: TextInputType.text),
              SizedBox(height: 30),
              TextFormItem(controller: phoneController, label: "Phone",type: TextInputType.phone),
              SizedBox(height: 30),
              TextFormItem(label: "Email", controller: emailController ,type: TextInputType.emailAddress),
              SizedBox(height: 30),
              TextFormItem(label: "Password", controller: passwordController ,type: TextInputType.text),
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
                            title: Text("Error"),
                            content: Text(message),
                            actions: [
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("try again"),
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
                    "Sign Up",
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
          onTap: () => Navigator.pushNamed(context, LogIn.route_name),
          child: Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan(
                  text: "Already have an account?? ",
                  style: TextTheme.of(context).displaySmall,
                ),
                TextSpan(
                  text: "Log in",
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
