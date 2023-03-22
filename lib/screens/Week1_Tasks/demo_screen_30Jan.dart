import 'package:flutter/material.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            height: 360.0,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Oeschinen Lake Campground'),
                      Text('Kandersteg, Switzerland'),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  child: Icon(isChecked ? Icons.star : Icons.star_border,
                      color: Colors.deepOrangeAccent),
                ),
                const Text("41"),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Icon(
                      Icons.call,
                      color: Colors.blue,
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: const Text("CALL", style: TextStyle(color: Colors.blue),)
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Icon(
                      Icons.near_me,
                      color: Colors.blue,
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: const Text("ROUTE", style: TextStyle(color: Colors.blue),)
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Icon(
                      Icons.share,
                      color: Colors.blue,
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: const Text("SHARE", style: TextStyle(color: Colors.blue),)
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(32.0),
            child: Text(
              'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                'Alps. Situated 1,578 meters above sea level, it is one of the '
                'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                'half-hour walk through pastures and pine forest, leads you to the '
                'lake, which warms to 20 degrees Celsius in the summer. Activities '
                'enjoyed here include rowing, and riding the summer toboggan run.',
            ),
          ),
        ],
      ),
    );
  }
}
