import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list22/Taps/Tasks/task_tab.dart';
import 'package:todo_list22/Taps/settings/settings_tab.dart';
import 'package:todo_list22/bottom_sheets/add_task_bottom_sheet.dart';
import 'app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String route_name="home";
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary_light,
      appBar: AppBar(
        title: Text("To Do List",
          style: GoogleFonts.poppins(
            color: AppColors.white_color,
            fontSize: 22,
            fontWeight: FontWeight.w700
          ),
        ),
        backgroundColor: AppColors.blue_color,
      ),
      bottomNavigationBar: BottomAppBar(
         padding: EdgeInsets.all(0),
        notchMargin: 10,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(items:[
          BottomNavigationBarItem(icon: Icon(Icons.format_list_bulleted),label: "list"),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),label: "Home"),
        ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          onTap: (index) {
            selectedIndex=index;
            setState(() {

            });
          },
          currentIndex: selectedIndex,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedItemColor: AppColors.blue_color,
          unselectedItemColor: AppColors.gray_color4,
          iconSize: 30,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            showModalBottomSheet(
                context: context,

                // to allow the bottom sheet to go up when the keyboard opened
                builder: (context) => Padding(
                  padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskBottomSheet(),
                ),
            );
          },
        backgroundColor: AppColors.blue_color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: AppColors.white_color,
            width: 2
          )
        ),
      child: Icon(
        Icons.add,
        size: 35,
        color: AppColors.white_color,),),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      body: tabs[selectedIndex]
    );
  }

  List<Widget> tabs=[TaskTab(),SettingsTab()];
}
