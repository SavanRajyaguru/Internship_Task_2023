import 'package:flutter/material.dart';

import 'package:project1/screens/feb2_screen/splash_screen_2Feb.dart';
import 'package:project1/screens/feb3_screen/phone_directory_screen_feb3.dart';
import 'package:project1/screens/feb6_screen/custom_widget_demo.dart';
import 'package:project1/screens/feb7_screen/animation_demo.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimationDemo(),
    );
  }
}