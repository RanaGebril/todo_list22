import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list22/app_colors.dart';
import 'package:todo_list22/firebaseFunctions.dart';
import 'package:todo_list22/models/task_models.dart';


class TaskItem extends StatelessWidget {
  TaskModel taskModel;
  TaskItem({super.key,required this.taskModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      height: 115,
      decoration: BoxDecoration(
        color: AppColors.white_color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
          color: Colors.grey,
          spreadRadius: 3,
          blurRadius: 5,
          offset: Offset(0, 10),
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
              foregroundColor: AppColors.white_color,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              padding: EdgeInsets.zero,
              // spacing: ,
            ),
            const SlidableAction(
              onPressed: null,
              backgroundColor: Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'edit',
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                margin:EdgeInsets.only(right: 10,left: 5),
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
                      style:GoogleFonts.poppins(
                          color: AppColors.blue_color,
                          fontWeight: FontWeight.w700,
                          fontSize: 18
                      ) ,),
                    Text(taskModel.subTitle,
                      style:GoogleFonts.roboto(
                          color: AppColors.gray_color2,
                          fontWeight: FontWeight.w400,
                          fontSize: 12
                      ) ,)
                  ],
                ),
              ),
              Spacer(),
              ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                      elevation: 15,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      backgroundColor: AppColors.blue_color,
                    padding: EdgeInsets.all(5),
                  ),
                  child: Icon(Icons.done,
                    color: AppColors.white_color,
                    size: 30,
                    weight: 100,)),
            ],
          ),
        ),
      ),
    );
  }
}
