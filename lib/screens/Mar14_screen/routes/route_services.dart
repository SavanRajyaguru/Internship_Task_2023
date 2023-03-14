import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/screens/Mar14_screen/screens/dynamiclink_demo.dart';
import 'package:project1/screens/Week1_Tasks/demo_screen_31Jan.dart';

class RouteServices {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch(routeSettings.name){
      case "/":
        return MaterialPageRoute(builder: (_) => const DynamicLink());
      case "/homeScreen":
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return _errorRoute();
    }

  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text("Page not Found!"),
        ),
      );
    });
  }
}