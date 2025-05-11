import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_list22/Taps/Tasks/task_item.dart';
import 'package:todo_list22/app_colors.dart';

class TaskTab extends StatelessWidget {
  const TaskTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 365*2)),
          lastDate: DateTime.now().add(Duration(days: 365*2)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: AppColors.gray_color3,
          dayColor: AppColors.blue_color,
          activeDayColor: AppColors.white_color,
          activeBackgroundDayColor: AppColors.blue_color,
          // selectableDayPredicate: (date) => date.day != 23,
          dotColor: Color(0xffd351a1),
          locale: 'en_ISO',
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return TaskItem();
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 5,
                );
              },
              itemCount: 20
          ),
        )

      ],

    );
  }
}
