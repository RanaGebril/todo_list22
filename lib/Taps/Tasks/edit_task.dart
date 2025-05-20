import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list22/app_colors.dart';
import 'package:todo_list22/firebaseFunctions.dart';
import 'package:todo_list22/models/task_models.dart';
import 'package:todo_list22/providers/app_provider.dart';

class EditTask extends StatefulWidget {
  static const String route_name="edit";
   EditTask({super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {

  @override
  Widget build(BuildContext context) {
    var model=ModalRoute.of(context)?.settings.arguments as TaskModel;
    var provider_object=Provider.of<AppProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        title: Text("appBarTitle".tr(),
          style: TextTheme.of(context).titleLarge
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,

              children: [
                Text("editTask".tr(),
                  style: TextTheme.of(context).titleMedium,
                  textAlign: TextAlign.center,),

                SizedBox(
                  height: 30,
                ),


                Text("taskTitle".tr(),
                    style: TextTheme.of(context).titleMedium?.copyWith(
                      fontSize: 18
                    )),
                TextFormField(
                 initialValue: model.title,
                  onChanged: (newTitle) {
                    model.title=newTitle;
                  },
                  style: TextTheme.of(context).labelSmall?.copyWith(
                 color: provider_object.AppTheme==ThemeMode.light?
                     AppColors.gray_color3:
                     AppColors.gray_color4,
                  ),
                ),

                SizedBox(
                  height: 35,
                ),

                Text("description".tr(),
                    style: TextTheme.of(context).titleMedium?.copyWith(
                        fontSize: 18
                    )),
                TextFormField(
                  initialValue: model.subTitle,
                  onChanged: (newSubTitle) {
                    model.subTitle=newSubTitle;
                  },
                  style: TextTheme.of(context).labelSmall?.copyWith(
                    color: provider_object.AppTheme==ThemeMode.light?
                    AppColors.gray_color3:
                    AppColors.gray_color4,
                  ),
                ),
                SizedBox(
                  height: 35,
                ),

                Text("selectTime".tr(),
                  style: TextTheme.of(context).titleMedium?.copyWith(
                      fontSize: 18
                  )),

                SizedBox(
                  height: 15,
                ),


                InkWell(
                  onTap: () async{
                    DateTime newDate =await selectDateFun(context,model,provider_object);
                    if(newDate != null){
                      model.date=newDate.millisecondsSinceEpoch;
                    }
                    setState(() {
                    });
                  },
                  child: Text(DateFormat.yMd().format(DateTime.fromMillisecondsSinceEpoch(model.date)),
                    textAlign:TextAlign.center,
                      style: TextTheme.of(context).titleSmall?.copyWith(
                        color: AppColors.gray_color3

                      ),
                    ),
                ),

                SizedBox(
                  height: 30,
                ),

                ElevatedButton(
                    onPressed: () {
                      Firebasefunctions.updateTask(model);
                      Navigator.pop(context);

                    },
                    child: Text("saveChanges".tr(),
                      style: TextTheme.of(context).titleSmall?.copyWith(
                          color: AppColors.white_color
                      ),
                    ),
                  //

                ),

                SizedBox(
                  height: 30,
                ),
              ],

            ),
          ),
        ),
      ),
    );
  }

  selectDateFun(BuildContext context,TaskModel model, AppProvider provider_opject)async{
    DateTime? chosenDate= await showDatePicker(
      context: context,
      initialDate: DateTime.fromMillisecondsSinceEpoch(model.date),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      builder: (context, child) {
        return Theme(data: ThemeData().copyWith(
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
            child: child!);
      },
    );
    return chosenDate;
  }
}
