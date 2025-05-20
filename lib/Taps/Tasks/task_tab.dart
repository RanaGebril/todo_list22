import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_list22/Taps/Tasks/task_item.dart';
import 'package:todo_list22/app_colors.dart';
import 'package:todo_list22/firebaseFunctions.dart';

class TaskTab extends StatefulWidget {
  TaskTab({super.key});

  @override
  State<TaskTab> createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  DateTime taskDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),

        CalendarTimeline(
          initialDate: taskDate,
          firstDate: DateTime.now().subtract(Duration(days: 365 * 2)),
          lastDate: DateTime.now().add(Duration(days: 365 * 2)),
          onDateSelected: (date) {
            // date is the date come from the calender used when
            // get the tasks to filter by data
            taskDate = date;
            setState(() {});
          },
          leftMargin: 20,
          monthColor: AppColors.gray_color3,
          dayColor: AppColors.blue_color,
          activeDayColor: AppColors.white_color,
          activeBackgroundDayColor: AppColors.blue_color,
          dotColor: AppColors.dot_Color,
          locale: context.locale.toString()
        ),

        SizedBox(height: 10),

        StreamBuilder(
          // get the data of the data i opened in the time line
          stream: Firebasefunctions.getTasks(taskDate),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("error".tr(),
                  style: TextTheme.of(context).labelSmall));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.blue_color),
              );
            }

            // map list of snapshots to list of task model
            var tasks = snapshot.data?.docs.map((doc) => doc.data()).toList();

            if (tasks!.isEmpty) {
              return Center(child:
              Text("noTasks".tr(),
              style: TextTheme.of(context).labelSmall));
            }

            return Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return TaskItem(taskModel: tasks[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 7);
                },
                itemCount: tasks.length,
              ),
            );
          },
        ),
      ],
    );
  }
}
