import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/screens/feb10_screen/widget/PostListView.dart';
import 'package:project1/screens/feb13_screen/widget/post_screen.dart';
import 'package:project1/screens/feb14_screen/widget/Counter2_Screen.dart';
import 'package:project1/screens/feb14_screen/widget/Counter3_Screen.dart';
import 'package:project1/screens/feb14_screen/widget/Counter_Screen.dart';

import 'package:project1/screens/feb2_screen/splash_screen_2Feb.dart';
import 'package:project1/screens/feb3_screen/phone_directory_screen_feb3.dart';
import 'package:project1/screens/feb6_screen/custom_widget_demo.dart';
import 'package:project1/screens/feb7_screen/animation_demo.dart';
import 'package:project1/screens/feb7_screen/todos_screen.dart';
import 'package:project1/screens/feb8_screen/setState_demo.dart';
import 'package:project1/screens/feb9_screen/Bloc/counter_bloc.dart';
import 'package:project1/screens/feb9_screen/Widget/counter_screen.dart';

import 'screens/feb14_screen/cubit/counter_cubit.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/counter',
      routes: {
        '/counter': (context) =>
            BlocProvider.value(
              value: _counterCubit,
              child: const CounterScreen(),
            ),
        '/secondCounter': (context) =>
            BlocProvider.value(
              value: _counterCubit,
              child: Counter2Screen(color: Colors.red),
            ),
        '/thirdCounter': (context) =>
            BlocProvider.value(
              value: _counterCubit,
              child: Counter3Screen(color: Colors.cyan),
            ),
      },
      // home: BlocProvider<CounterCubit>(
      //   create: (context) => CounterCubit(),
      //   child: const CounterScreen(),
      // ),
    );
  }
  @override
  void dispose() {
    _counterCubit.close();
    // TODO: implement dispose
    super.dispose();
  }
}