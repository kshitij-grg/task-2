import 'package:black_tech_task_2/constants.dart';
import 'package:black_tech_task_2/home/view/main_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Black Tech Task 2',
// setting theme color and font
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: primaryColor,
          ),
          fontFamily: 'Poppins Regular'),
      home: const MainView(),
    );
  }
}
