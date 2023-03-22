import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project1/screens/feb6_screen/widgets/custom_listtile.dart';

class StateDemo extends StatefulWidget {
  const StateDemo({Key? key}) : super(key: key);

  @override
  State<StateDemo> createState() => _StateDemoState();
}

class _StateDemoState extends State<StateDemo> {
  int _counter = 0;
  final random = Random();
  Color _color = Colors.indigoAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("setState Demo"),
      ),
      body: ListView.builder(
        itemCount: _counter,
        itemBuilder: (context, index) {
          return CustomListTile(
            title: 'Title',
            subtitle: "Subtitle",
            imageUrl: 'https://picsum.photos/800/1080',
            elevation: 5,
            titleSize: 18.0,
            subtitleSize: 16.0,
            tileColor: _color = Color.fromRGBO(
                random.nextInt(300), random.nextInt(300),
                random.nextInt(300), 1),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _counter < 1 ? _counter = 0 : _counter--;
                  });
                  if (_counter == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.redAccent,
                      content: Text("Counter value is zero", style: TextStyle(
                          fontSize: 20.0),),
                      duration: Duration(milliseconds: 800),
                    ));
                  }
                },
                child: const Icon(Icons.remove),
              ),
            ),
          ),
          Expanded(
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
