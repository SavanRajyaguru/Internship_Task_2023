import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:project1/screens/Mar14_screen/path_constant.dart';
import 'package:url_launcher/url_launcher.dart';

class DynamicLink extends StatefulWidget {
  const DynamicLink({Key? key}) : super(key: key);

  @override
  State<DynamicLink> createState() => _DynamicLinkState();
}

class _DynamicLinkState extends State<DynamicLink> {

  FirebaseDynamicLinks firebaseDynamicLinks = FirebaseDynamicLinks.instance;

  Future<void> initDynamicLinks() async {
    firebaseDynamicLinks.onLink.listen((dynamicLinkData) {
      final Uri uri = dynamicLinkData.link;
      final queryParams = uri.queryParameters;
      if (queryParams.isNotEmpty) {
        String? productId = queryParams['id'];
        Navigator.pushNamed(context, dynamicLinkData.link.path,
            arguments: {"productId": int.parse(productId!)});
      } else {
        Navigator.pushNamed(context, dynamicLinkData.link.path);
      }
    }).onError((error) => print(error));
  }

  final parameters = DynamicLinkParameters(
      link: Uri.parse(kUriPrefix+kHomepageLink),
      uriPrefix: kUriPrefix,
      androidParameters: const AndroidParameters(packageName: "com.example.project1", minimumVersion: 0));


  Future<void> _makePhoneCall(String phoneNumber) async {

    if (await canLaunchUrl(Uri(scheme: 'tel', path: 'tel:1234567891'))) {
      final Uri lunchUri = Uri(scheme: 'tel', path: phoneNumber);
      await launchUrl(lunchUri);
    } else {
      print(' could not launch ');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    initDynamicLinks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DynamicLink Demo"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0)
                ),
                onPressed: () {
                  _makePhoneCall('1234567893');
                },
                child: const Text(
                  "Deep Linking", style: TextStyle(fontSize: 18.0),)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16.0)
                ),
                onPressed: () {},
                child: const Text(
                  "Dynamic Linking", style: TextStyle(fontSize: 18.0),))
          ],
        ),
      ),
    );
  }
}
