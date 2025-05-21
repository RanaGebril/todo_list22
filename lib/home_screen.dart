import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list22/Taps/Tasks/task_tab.dart';
import 'package:todo_list22/bottom_sheets/add_task_bottom_sheet.dart';
import 'package:todo_list22/firebaseFunctions.dart';
import 'package:todo_list22/providers/app_provider.dart';
import 'package:todo_list22/register/log_in.dart';
import 'Taps/settings/settings_tab.dart';
import 'app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String route_name = "home";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider_object=Provider.of<AppProvider>(context , listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${'appBarTitle'.tr()} ${provider_object.userModel?.firstName} ",
              style: TextTheme.of(context).titleLarge
        ),
        actions: [
          IconButton(onPressed: () => Firebasefunctions.logOut().then(
            Navigator.pushNamedAndRemoveUntil(context,LogIn.route_name,(route) => false,)
            as FutureOr Function(void value)
          ),
              icon: Icon(Icons.logout)),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted),
              label: "list",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: "Home",
            ),
          ],
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          currentIndex: selectedIndex,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,

            // to allow the bottom sheet to go up when the keyboard opened
            isScrollControlled: true,
            builder:
                (context) => Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: AddTaskBottomSheet(),
                ),
          );
        },
        child: Icon(Icons.add, color: AppColors.white_color),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [TaskTab(), SettingsTab()];
}
