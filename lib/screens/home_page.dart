import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mytasks/screens/add_task.dart';
import 'package:mytasks/utils/app_colors.dart';
import 'package:mytasks/widgets/button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        //set background image
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/welcome.jpg"),
          ),
        ),

        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: "Hello",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "\nstart your beautiful day!",
                    style: TextStyle(
                      color: AppColors.smallTextColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.9,
            ),
            Buttons(
                backgroundColor: AppColors.mainColor,
                buttonText: "Add Task",
                textColor: Colors.white),
            SizedBox(
              height: 12,
            ),
            Buttons(
              backgroundColor: Colors.white,
              buttonText: "View All",
              textColor: AppColors.mainColor,
            ),
          ],
        ),
      ),
    );
  }
}
