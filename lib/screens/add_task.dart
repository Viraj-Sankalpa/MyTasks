import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mytasks/main.dart';
import 'package:mytasks/utils/app_colors.dart';
import 'package:mytasks/widgets/button_widget.dart';
import 'package:mytasks/widgets/textfield_widget.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        //add title image
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/addtask.jpg",
            ),
          ),
        ),

        //add textfields
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldWidget(
                hintText: "Task name",
                borderRadius: 35,
                maxLine: 1,
                textController: nameController,
              ),
              SizedBox(
                height: 5,
              ),
              TextFieldWidget(
                hintText: "Your Task",
                borderRadius: 25,
                maxLine: 4,
                textController: detailController,
              ),
              SizedBox(
                height: 25,
              ),
              Buttons(
                backgroundColor: AppColors.mainColor,
                buttonText: "Add",
                textColor: Colors.white,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
