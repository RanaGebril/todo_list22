import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list22/app_colors.dart';
import 'package:todo_list22/firebaseFunctions.dart';
import 'package:todo_list22/models/task_models.dart';
import 'package:todo_list22/providers/app_provider.dart';
import 'package:todo_list22/text_form/text_form_item.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime? selectedDate = DateTime.now();
  var titleController = TextEditingController();
  var subTitleController = TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider_opject=Provider.of<AppProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "addNewTask".tr(),
              style: TextTheme.of(context).titleMedium?.copyWith(
                fontSize:20
              ),

              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),

            TextFormItem(
              controller: titleController,
              label: "taskTitle".tr(),
              type: TextInputType.text,
            validation: (titleController) {
              if(titleController==null || titleController.isEmpty){
                return "Enter task tittle";
              }
              return null;
            },),
            SizedBox(height: 25),
            TextFormItem(
                controller: subTitleController,
                label: "description".tr() ,
                type: TextInputType.text,
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                selectDateFun(context,provider_opject);
              },
              child: Text(
                selectedDate.toString().substring(0, 10),
                textAlign: TextAlign.center,
                style: TextTheme.of(context).titleSmall?.copyWith(
                  color: AppColors.gray_color3,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if(formKey.currentState!.validate()){
                  TaskModel task = TaskModel(
                    title: titleController.text,
                    subTitle: subTitleController.text,
                    userId: FirebaseAuth.instance.currentUser!.uid,
                    // to sdd the date at the start of the day 00:00
                    date: DateUtils.dateOnly(selectedDate!).millisecondsSinceEpoch,
                  );
                  Firebasefunctions.addTask(task).then((value) {
                    Navigator.pop(context);
                  });
                }
              },
              child: Text(
                "add".tr(),
                style: TextTheme.of(context).titleSmall?.copyWith(
                  color: AppColors.white_color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  selectDateFun(BuildContext context,AppProvider provider_opject) async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: ThemeData().copyWith(
              colorScheme: provider_opject.AppTheme==ThemeMode.light?
              ColorScheme(
                  primary: AppColors.blue_color,
                  onPrimary: AppColors.white_color,
                  surface: AppColors.white_color,
                  onSurface: AppColors.gray_color1,
                  secondary: AppColors.white_color,
                  brightness: Brightness.light,
                  onSecondary: Colors.transparent,
                  error: Colors.transparent,
                  onError: Colors.transparent
              ):
              ColorScheme(
                  primary: AppColors.blue_color,
                  onPrimary: AppColors.white_color,
                  surface: AppColors.secondry_dark,
                  onSurface: AppColors.white_color,
                  secondary: AppColors.white_color,
                  brightness: Brightness.light,
                  onSecondary: Colors.transparent,
                  error: Colors.transparent,
                  onError: Colors.transparent
              )
          ),
          child: child!,
        );
      },
    );
    if (chosenDate != selectedDate) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }
}
