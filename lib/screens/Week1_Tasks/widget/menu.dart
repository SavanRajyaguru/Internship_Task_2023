import 'package:flutter/material.dart';

class IconMenu extends StatelessWidget {
  final IconData iconData;
  final String text;
  const IconMenu(this.iconData, this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 28.0, top: 15.0, bottom: 15.0, right: 28.0),
      child: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue.shade900,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                iconData,
                color: Colors.white,
                size: 26,
              ),
            ),
          ),
          const SizedBox(height: 8.0,),
          Text(text, style: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
