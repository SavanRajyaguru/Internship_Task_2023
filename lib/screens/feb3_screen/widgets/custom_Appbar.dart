import 'package:flutter/material.dart';
import 'package:project1/screens/feb3_screen/setting_screen.dart';

class CustomAppBar extends StatelessWidget {
  String appbarName;
  IconData iconData;
  CustomAppBar({
    Key? key,
    required this.appbarName,
    required this.iconData
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if(iconData == Icons.arrow_back_ios_new) {
              Navigator.pop(context);
            }
            else {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingScreen()));
            }
          },
          icon: Icon(
            iconData,
            color: Colors.indigo.shade600,
            size: 35.0,
          ),
        ),
        Expanded(
          child: Text(
            appbarName,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 28.0, color: Colors.black),
          ),
        ),
        Icon(
          iconData,
          color: Colors.transparent,
          size: 35.0,
        ),
      ],
    );
  }
}