import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project1/screens/login_screen_2Feb.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen2Feb())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  children: const [
                    Text("Welcome to", style: TextStyle(fontSize: 20.0, color: Colors.black),),
                    Text("Digihappy", style: TextStyle(fontSize: 30.0, color: Colors.deepPurple, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20.0),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/Spalsh.png'),
                      ),
                    ),
                  ),
                  Container(
                    height: 90.0,
                    decoration: const BoxDecoration(
                      // color: Colors.purpleAccent,
                      image: DecorationImage(
                        image: AssetImage('images/digihappyLogo.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
