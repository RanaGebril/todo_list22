import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_list22/Taps/Tasks/edit_task.dart';
import 'package:todo_list22/app_colors.dart';
import 'package:todo_list22/firebaseFunctions.dart';
import 'package:todo_list22/models/task_models.dart';
import 'package:todo_list22/providers/app_provider.dart';


class TaskItem extends StatelessWidget {
  TaskModel taskModel;
  TaskItem({super.key,required this.taskModel});

  @override
  Widget build(BuildContext context) {
    var provider_opject=Provider.of<AppProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      height: 115,

      decoration: BoxDecoration(
        color: provider_opject.AppTheme==ThemeMode.light?
        AppColors.white_color : AppColors.secondry_dark,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
          color: provider_opject.AppTheme==ThemeMode.light?
          AppColors.gray_color3 : AppColors.light_blue,
          spreadRadius: 0,
          blurRadius: 5,
          offset: Offset(0, 3),
        )]
      ),

      child: Slidable(
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.5,
          children: [
            SlidableAction(
              onPressed: (context) => Firebasefunctions.deleteTask(taskModel.id),
              backgroundColor: AppColors.red_color,
              icon: Icons.delete,
              label: 'delete'.tr(),
              borderRadius:  context.locale.languageCode == 'en'?
              BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15)
              ):
              BorderRadius.only(
                  topLeft: Radius.circular(0),
                  bottomLeft: Radius.circular(0)
              ),
              padding: EdgeInsets.zero,
              // spacing: ,
            ),
            SlidableAction(
              onPressed:(context) {
                Navigator.pushNamed(context, EditTask.route_name,
                arguments: taskModel);
              },
              backgroundColor: AppColors.blue_color,
              icon: Icons.edit,
              label: 'edit'.tr(),
              borderRadius:  context.locale.languageCode == 'ar'?
              BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15)
              ):
              BorderRadius.only(
                  topLeft: Radius.circular(0),
                  bottomLeft: Radius.circular(0)
              ),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10,left: 5),
                decoration: BoxDecoration(
                  color: AppColors.blue_color,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 4,
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  children: [
                    Text(taskModel.title,
                      style: TextTheme.of(context).titleSmall?.copyWith(
                        color: AppColors.blue_color
                      )
                    ),
                    Text(taskModel.subTitle,
                      style: TextTheme.of(context).displaySmall)
                  ],
                ),
              ),
              Spacer(),

              taskModel.isDone==true ?
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("done".tr(),
                  style: TextTheme.of(context).displayMedium
                ),
              )
                  : ElevatedButton(onPressed: (){
                taskModel.isDone=true;
                Firebasefunctions.updateTask(taskModel);
              },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(5),
                  ),
                  child:
                  Icon(Icons.done,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
