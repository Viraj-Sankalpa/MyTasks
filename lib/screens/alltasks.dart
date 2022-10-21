import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mytasks/main.dart';
import 'package:mytasks/screens/add_task.dart';
import 'package:mytasks/screens/home_page.dart';
import 'package:mytasks/utils/app_colors.dart';
import 'package:mytasks/widgets/button_widget.dart';
import 'package:mytasks/widgets/tasks_widget.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({super.key});

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) {
    List myData = [
      "Try harder",
      "Try smarter",
    ];

    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color(0xFF2e3253),
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
    );
    final rightEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.redAccent,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
      alignment: Alignment.centerRight,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          //header image and back arrow button
          Container(
            padding: EdgeInsets.only(left: 20, top: 60),
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Icon(
                Icons.arrow_back,
                color: AppColors.secondaryColor,
              ),
            ),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 3.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/header1.jpg"),
              ),
            ),
          ),

          //home, add and calender icons
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => HomePage())));
                  },
                  child: Icon(
                    Icons.home,
                    color: AppColors.secondaryColor,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => AddTask())));
                  },
                  child: Icon(
                    Icons.add_circle_outline,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Icon(
                  Icons.calendar_month,
                  color: AppColors.secondaryColor,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "2",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ],
            ),
          ),

          //task titles
          Flexible(
            child: ListView.builder(
              itemCount: myData.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: leftEditIcon,
                  secondaryBackground: rightEditIcon,
                  onDismissed: (DismissDirection direction) {
                    print("after dismiss");
                  },
                  confirmDismiss: (DismissDirection direction) async {
                    // print("confirming");
                    if (direction == DismissDirection.startToEnd) {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (_) {
                            return Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF2e3253).withOpacity(0.4),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              height: 300,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Buttons(
                                      backgroundColor: AppColors.mainColor,
                                      buttonText: "View",
                                      textColor: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Buttons(
                                      backgroundColor: AppColors.mainColor,
                                      buttonText: "Edit",
                                      textColor: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                      return false;
                    } else {
                      return Future.delayed(Duration(seconds: 1),
                          () => direction == DismissDirection.endToStart);
                    }
                  },
                  key: ObjectKey(index),
                  child: Container(
                    child: TaskWidget(text: myData[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
