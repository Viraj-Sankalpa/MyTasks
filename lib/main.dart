import 'package:flutter/material.dart';
import 'package:mytasks/screens/add_task.dart';
import 'package:mytasks/screens/alltasks.dart';
import 'package:mytasks/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AllTasks(),
    );
  }
}
