import 'package:flutter/material.dart';
import 'package:project1/screens/feb6_screen/widgets/custom_listtile.dart';

class CustomWidgetDemo extends StatelessWidget {
  const CustomWidgetDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String descText =
        "Description Line 1\nDescription Line 2\nDescription Line 3\nDescription Line 4\nDescription Line 5\nDescription Line 6\nDescription Line 7\nDescription Line 8";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Widget"),
      ),
      body: ListView(
        children: [
          CustomListTile(
            title: "Demo",
            subtitle: "Hii There!",
            imageUrl: "https://picsum.photos/100/300",
            iconSize: 30.0,
          ),
          CustomListTile(
            title: "Hello World",
            subtitle: "Welcome",
            imageUrl: "https://picsum.photos/100/300",
            radius: 15.0,
            tileColor: Colors.orange,
            icon: Icons.add,
            iconColor: Colors.black,
            iconSize: 30.0,
            titleColor: Colors.white,
          ),
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            children: [
              Chip(
                label: const Text("ChipsDemo"),
                elevation: 10.0,
                backgroundColor: Colors.greenAccent[400],
                padding: const EdgeInsets.all(8),
                avatar: const CircleAvatar(backgroundImage: NetworkImage("https://picsum.photos/100/300")),
              ),
              Chip(
                label: const Text("ChipsDemo"),
                elevation: 10.0,
                backgroundColor: Colors.greenAccent[400],
                padding: const EdgeInsets.all(8),
                avatar: const CircleAvatar(backgroundImage: NetworkImage("https://picsum.photos/100/300")),
              ),
              Chip(
                label: const Text("ChipsDemo"),
                elevation: 10.0,
                backgroundColor: Colors.greenAccent[400],
                padding: const EdgeInsets.all(8),
                avatar: const CircleAvatar(backgroundImage: NetworkImage("https://picsum.photos/100/300")),
              ),
              Chip(
                label: const Text("ChipsDemo"),
                elevation: 10.0,
                backgroundColor: Colors.greenAccent[400],
                padding: const EdgeInsets.all(8),
                avatar: const CircleAvatar(backgroundImage: NetworkImage("https://picsum.photos/100/300")),
              ),
            ],
          ),
          CustomListTile(
            title: descText,
            elevation: 10.0,
            subtitle: "Welcome",
            subtitleSize: 30.0,
            avatarRadius: 30.0,
            imageUrl: "https://picsum.photos/100/300",
            radius: 30.0,
            tileColor: Colors.blue,
            icon: Icons.add,
            iconColor: Colors.black,
            iconSize: 40.0,
            titleColor: Colors.black,
          ),
          CustomListTile(
            elevation: 0,
            title: "Title",
            subtitle: "Subtitle",
            imageUrl: "https://picsum.photos/100/300",
            iconSize: 30.0,
            tileColor: Colors.cyanAccent,
          ),
          CustomListTile(
            title: descText,
            elevation: 10.0,
            subtitle: "Subtitle",
            subtitleSize: 20.0,
            avatarRadius: 30.0,
            imageUrl: "https://picsum.photos/100/300",
            radius: 20.0,
            tileColor: Colors.amber,
            icon: Icons.add,
            iconColor: Colors.black,
            iconSize: 40.0,
            titleColor: Colors.black,
          ),
          CustomListTile(
            title: descText,
            elevation: 10.0,
            subtitle: "Welcome",
            subtitleSize: 20.0,
            avatarRadius: 30.0,
            imageUrl: "https://picsum.photos/100/300",
            radius: 16.0,
            tileColor: Colors.redAccent,
            icon: Icons.add,
            iconColor: Colors.black,
            iconSize: 40.0,
            titleColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
