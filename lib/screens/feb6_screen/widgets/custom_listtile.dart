import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {

  String title;
  String subtitle;
  String imageUrl;
  IconData icon;
  double radius, iconSize, elevation, titleSize, subtitleSize, avatarRadius;
  Color titleColor, subtitleColor, iconColor, tileColor;

  CustomListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.icon = Icons.menu,
    this.radius = 0.0,
    this.iconSize = 25.0,
    this.avatarRadius = 30.0,
    this.elevation = 0,
    this.titleSize = 14.0,
    this.subtitleSize = 14.0,
    this.iconColor = Colors.grey,
    this.titleColor = Colors.black,
    this.subtitleColor = Colors.black,
    this.tileColor = Colors.white
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ListTile(
        title: Text(title, style: TextStyle(fontSize: titleSize, color: titleColor)),
        subtitle: Text(subtitle, style: TextStyle(fontSize: subtitleSize, color: subtitleColor)),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
          radius: avatarRadius,
        ),
        trailing: Icon(icon, size: iconSize, color: iconColor,),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        tileColor: tileColor,
      ),
    );
  }
}