import 'package:flutter/material.dart';
import 'package:project1/screens/feb2_screen/login_screen_2Feb.dart';
import 'package:project1/screens/feb3_screen/widgets/custom_Appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0, left: 15.0, right: 15.0,),
        child: Column(
          children: [
            CustomAppBar(appbarName: 'Settings', iconData: Icons.arrow_back_ios_new),
            const SizedBox(height: 30.0,),
            buildCardMenu('Terms and Conditions', Icons.arrow_forward_ios),
            buildCardMenu('Update', Icons.arrow_forward_ios),
            buildCardMenu('Edit Profile Photo', Icons.arrow_forward_ios),
            buildCardMenu('Edit User Information', Icons.edit),
            buildCardMenu('Reset Password', Icons.arrow_forward_ios),
            buildCardMenu('Reset Application', Icons.arrow_forward_ios),
            GestureDetector(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen2Feb()));
              },
                child: buildCardMenu('Log Out', Icons.arrow_forward_ios)),
          ],
        ),
      ),
    );
  }

  Card buildCardMenu(String text, IconData iconData) {
    return Card(
      color: Colors.indigo.shade50,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text , style: const TextStyle(fontSize: 16.0),),
            Icon(iconData)
          ],
        ),
      ),
    );
  }
}
