import 'dart:math';

import 'package:flutter/material.dart';

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({Key? key}) : super(key: key);

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));

  double _width = 100;
  double _height = 100;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
        child: ListView(
          children: [
            const Divider(
              color: Colors.greenAccent,
              thickness: 2.0,
            ),
            const Text(
              "FadeTransition",
              style: TextStyle(fontSize: 20.0),
            ),
            const Divider(
              color: Colors.greenAccent,
              thickness: 2.0,
            ),
            FadeTransition(
              opacity: _animation,
              child: const Center(
                  child: FlutterLogo(
                size: 100.0,
              )),
            ),
            const Divider(
              color: Colors.greenAccent,
              thickness: 2.0,
            ),
            const Text(
              "SizeTransition",
              style: TextStyle(fontSize: 20.0),
            ),
            const Divider(
              color: Colors.greenAccent,
              thickness: 2.0,
            ),
            SizeTransition(
              sizeFactor: _animation,
              axis: Axis.horizontal,
              axisAlignment: 0,
              child: const Center(
                child: FlutterLogo(
                  size: 100.0,
                ),
              ),
            ),
            const Divider(
              color: Colors.greenAccent,
              thickness: 2.0,
            ),
            const Text(
              "SlideTransition",
              style: TextStyle(fontSize: 20.0),
            ),
            const Divider(
              color: Colors.greenAccent,
              thickness: 2.0,
            ),
            SlideTransition(
              position: _offsetAnimation,
              child: const FlutterLogo(
                size: 100.0,
              ),
            ),
            const Divider(
              color: Colors.greenAccent,
              thickness: 2.0,
            ),
            const Text(
              "AnimatedContainer",
              style: TextStyle(fontSize: 20.0),
            ),
            const Divider(
              color: Colors.greenAccent,
              thickness: 2.0,
            ),
            Center(
              child: AnimatedContainer(
                height: _height,
                width: _width,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: _borderRadius,
                ),
                duration: const Duration(seconds: 1),
                curve: Curves.easeOut,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // random generator
            final random = Random();

            // random dimension generator
            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();

            // random color generator
            _color = Color.fromRGBO(
              random.nextInt(300),
              random.nextInt(300),
              random.nextInt(300),
              1,
            );

            // random radius generator
            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
        backgroundColor: Colors.greenAccent,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
