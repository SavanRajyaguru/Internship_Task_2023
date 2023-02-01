import 'package:flutter/material.dart';
import 'package:project1/screens/check_radio_floating.dart';
import 'package:project1/screens/checkout_details_screen_31Jan.dart';
import 'package:project1/screens/demo_screen_30Jan.dart';
import 'package:project1/screens/demo_screen_31Jan.dart';
import 'package:project1/screens/first_demo_screen.dart';
import 'package:project1/screens/imagePicker.dart';
import 'package:project1/screens/listview_gridview_stack_demo.dart';
import 'package:project1/screens/login_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckoutDetails(),
    );
  }
}