import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_list22/app_colors.dart';
import 'package:todo_list22/app_theme_data.dart';
import 'package:todo_list22/firebaseFunctions.dart';
import 'package:todo_list22/models/task_models.dart';

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

    return Scaffold(

      appBar: AppBar(
        title: Text("To Do List",
          style: TextTheme.of(context).titleLarge
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,

              children: [
                Text("Edit Task",
                  style: TextTheme.of(context).titleMedium,
                  textAlign: TextAlign.center,),

                SizedBox(
                  height: 30,
                ),


                TextFormField(
                 initialValue: model.title,
                  onChanged: (newTitle) {
                    model.title=newTitle;
                  },
                  decoration: InputDecoration(
                      label:   Text("Title",
                        style: TextTheme.of(context).titleSmall),
                  ),
                ),

                SizedBox(
                  height: 35,
                ),

                TextFormField(
                  initialValue: model.subTitle,
                  onChanged: (newSubTitle) {
                    model.subTitle=newSubTitle;
                  },
                  decoration: InputDecoration(
                    label:   Text("description",
                      style: TextTheme.of(context).titleSmall),

                  ),


                ),
                SizedBox(
                  height: 35,
                ),

                Text("Select time",
                  style: TextTheme.of(context).titleSmall),

                SizedBox(
                  height: 15,
                ),


                InkWell(
                  onTap: () async{
                    DateTime newDate =await selectDateFun(context,model);
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
                    child: Text("Edit",
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

  selectDateFun(BuildContext context,TaskModel model)async{
    DateTime? chosenDate= await showDatePicker(
      context: context,
      initialDate: DateTime.fromMillisecondsSinceEpoch(model.date),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      builder: (context, child) {
        return Theme(data: ThemeData().copyWith(
            colorScheme: ColorScheme(
                primary: AppColors.blue_color,
                onPrimary: AppColors.white_color,
                surface: AppColors.white_color,
                onSurface: AppColors.gray_color1,
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
