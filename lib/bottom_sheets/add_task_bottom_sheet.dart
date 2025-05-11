import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list22/app_colors.dart';

class AddTaskBottomSheet extends StatefulWidget {
   AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime? selectedDate=DateTime.now();
  var titleController =TextEditingController();
  var subTitleController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,

        children: [
          Text("Add new Task",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.gray_color1,
          ),
          textAlign: TextAlign.center,),
          SizedBox(
            height: 10,
          ),

          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              label:   Text("Title",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.gray_color1,
                ),),
              focusColor: AppColors.blue_color,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              )
            ),
          ),
          SizedBox(
            height: 25,
          ),

          TextFormField(
            decoration: InputDecoration(
              label: Text("Description",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.gray_color1,
                ),),
                focusColor: AppColors.blue_color,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                )
            ),

          ),
          SizedBox(
            height: 20,
          ),

          InkWell(
            onTap: () {
               selectDateFun(context);
            },
            child: Text(selectedDate.toString().substring(0,10),
              textAlign:TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.gray_color4,
              ),),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: (){
              // TaskModel task=TaskModel(title: titleController.toString(),
              //     subTitle: subTitleController.toString(),
              //     date: selectedDate!.millisecondsSinceEpoch);
              // Firebasefunctions.addTask(task);
            },

              child: Text("Add Task",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColors.white_color,
              ),),
          style:ElevatedButton.styleFrom(
            elevation: 15,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)),
            backgroundColor: AppColors.blue_color,
          ),)

        ],

      ),
    );
  }

  selectDateFun(BuildContext context)async{
    DateTime? chosenDate= await showDatePicker(
      context: context,
      initialDate: selectedDate,
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
    if(chosenDate!=selectedDate){
      selectedDate=chosenDate;
      setState(() {

      });

    }
  }
}
