import 'package:flutter/material.dart';

import 'package:project1/screens/feb2_screen/splash_screen_2Feb.dart';
import 'package:project1/screens/feb3_screen/phone_directory_screen_feb3.dart';
import 'package:project1/screens/feb6_screen/custom_widget_demo.dart';
import 'package:project1/screens/feb7_screen/animation_demo.dart';
import 'package:project1/screens/feb7_screen/todos_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/displayTodo',
      routes: {
        '/animationDemo': (context) => const AnimationDemo(),
        '/displayTodo' : (context) => const DisplayTodos(),
        '/splashScreen' : (context) => const SplashScreen(),
      },
      // home: AnimationDemo(),
    );
  }
}