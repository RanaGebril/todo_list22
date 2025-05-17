import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list22/Taps/settings/theme_dropdown.dart';
import 'package:todo_list22/app_colors.dart';
import 'package:todo_list22/providers/app_provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider_object=Provider.of<AppProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 30),

          Text("Mode",
            style: TextTheme.of(context).titleMedium,
          ),
          ThemeDropdown(),




        ],
      ),
    );
  }
}
