import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/screens/feb10_screen/widget/PostListView.dart';

import 'package:project1/screens/feb2_screen/splash_screen_2Feb.dart';
import 'package:project1/screens/feb3_screen/phone_directory_screen_feb3.dart';
import 'package:project1/screens/feb6_screen/custom_widget_demo.dart';
import 'package:project1/screens/feb7_screen/animation_demo.dart';
import 'package:project1/screens/feb7_screen/todos_screen.dart';
import 'package:project1/screens/feb8_screen/setState_demo.dart';
import 'package:project1/screens/feb9_screen/Bloc/counter_bloc.dart';
import 'package:project1/screens/feb9_screen/Widget/counter_screen.dart';

void main() {
  Bloc.observer = CounterBloc();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/setStateDemo',
      // routes: {
      //   '/animationDemo': (context) => const AnimationDemo(),
      //   '/displayTodo' : (context) => const DisplayTodos(),
      //   '/splashScreen' : (context) => const SplashScreen(),
      //   '/setStateDemo' : (context) => const StateDemo(),
      // },
      home: PostListView(),
    );
  }
}