import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list22/app_colors.dart';
import 'package:todo_list22/providers/app_provider.dart';

class ThemeDropdown extends StatelessWidget {
  const ThemeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    var provider_object = Provider.of<AppProvider>(context);
    return DropdownButtonFormField<ThemeMode>(
      value: provider_object.AppTheme,
      decoration: InputDecoration(
        border: InputBorder.none,

        filled: true,
        fillColor:
            provider_object.AppTheme == ThemeMode.light
                ? AppColors.white_color
                : AppColors.secondry_dark,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blue_color),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blue_color),
        ),
      ),

      items: [
        DropdownMenuItem(
          child: Text(
            "Light",
            style: TextTheme.of(
              context,
            ).displaySmall?.copyWith(color: AppColors.blue_color),
          ),
          value: ThemeMode.light,
        ),
        DropdownMenuItem(
          child: Text(
            "Dark",
            style: TextTheme.of(
              context,
            ).displaySmall?.copyWith(color: AppColors.blue_color),
          ),
          value: ThemeMode.dark,
        ),
      ],
      dropdownColor: AppColors.white_color,

      onChanged: (themeToChange) {
        provider_object.changeTheme(themeToChange!);
      },
    );
  }
}
