import 'package:flutter/material.dart';
import 'package:todo_list22/app_colors.dart';

class TextFormItem extends StatelessWidget {
  TextEditingController controller;
  String label;
  TextInputType? type;
  String? Function(String?)? validation;

  TextFormItem({
    required this.controller,
    required this.label,
    required this.type,
     this.validation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validation,
      cursorColor: AppColors.white_color,
      style: TextTheme.of(context).displaySmall,
      decoration: InputDecoration(
        label: Text(label, style: TextTheme.of(context).displaySmall),
        focusColor: AppColors.blue_color,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: AppColors.blue_color),
        ),

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
