import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:project1/screens/Week1_Tasks/demo_screen_31Jan.dart';
import 'package:project1/screens/feb2_screen/services/authentication_services.dart';
import 'package:project1/screens/feb3_screen/phone_directory_screen_feb3.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen2Feb extends StatefulWidget {
  const LoginScreen2Feb({Key? key}) : super(key: key);

  @override
  State<LoginScreen2Feb> createState() => _LoginScreen2FebState();
}

class _LoginScreen2FebState extends State<LoginScreen2Feb> {
  final AuthenticationService _authService = AuthenticationService();
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;

  @override
  void initState() {
    // TODO: implement initState
    AuthenticationService().getUser();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  addEmailToSF() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', emailController.text);
    print(prefs.getString('email'));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          // color: Colors.black,
                          image: DecorationImage(
                              image: AssetImage('images/Login.png'))
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Digihappy",
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 10.0,),
                          Container(
                            height: 75.0,
                            width: 75.0,
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 30.0, color: Colors.black),
                ),
              ),

              // email form field
              emailFormField("Email Id", "Email Id"),
              const SizedBox(height: 20.0,),
              // password form field
              passFormField("Password", "Password"),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: ElevatedButton(
                    onPressed: () async {

                      if(_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        // shared Preference
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setString('email', emailController.text);
                        print(prefs.getString('email'));

                        Navigator.push(context, MaterialPageRoute(builder: (context) => const PhoneScreen()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(60.0),
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

              TextButton(
                  onPressed: () async {
                    final Uri toLaunch = Uri(scheme: 'https', host: 'www.google.com', path: 'headers/');
                    if(! await launchUrl(toLaunch ,mode: LaunchMode.inAppWebView)){
                      throw Exception('Could not launch $toLaunch');
                    }
                  },
                  child: const Text(
                    'Forgot Password?',
                    style:
                        TextStyle(fontSize: 16.0, color: Colors.deepPurple),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _authService.signInGoogle(context);
                    },
                    child: Container(
                      height: 60.0,
                      width: 55.0,
                      decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/google_logo.png')
                      )
                    ),),
                  ),
                  GestureDetector(
                    onTap: () {
                      _authService.signInFacebook(context);
                    },
                    child: Container(
                      height: 60.0,
                      width: 55.0,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/facebook_logo.png')
                          )
                      ),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Email Form field
  Widget emailFormField(String heading, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(heading, style: const TextStyle(fontSize: 16.0)),
        const SizedBox(
          height: 10.0,
        ),
        TextFormField(
          controller: emailController,
          cursorColor: Colors.deepPurple,
          validator: (value) {
            if(value!.isEmpty){
              return 'Please enter email';
            }
            return EmailValidator.validate(value) ? null : 'Please enter a valid email';
          },
          decoration: InputDecoration(
            hintText: " $hintText",
            hintStyle: const TextStyle(fontSize: 14),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(13.0)),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(13.0)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(13.0)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(13.0)),
            ),
          ),
        ),
      ],
    );
  }

  /// Password From Field
  Widget passFormField(String heading, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(heading, style: const TextStyle(fontSize: 16.0)),
        const SizedBox(
          height: 10.0,
        ),
        TextFormField(
          controller: passwordController,
          obscureText: obscureText,
          cursorColor: Colors.deepPurple,
          validator: (value) {
            if(value!.isEmpty){
              return 'Please enter password';
            } else if(value.length < 6){
              return 'Enter password more then six character';
            }
            return null;
          },
          decoration: InputDecoration(
              hintText: " $hintText",
              hintStyle: const TextStyle(fontSize: 14),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(13.0)),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(13.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(13.0)),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(13.0)),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
              )),
        ),
      ],
    );
  }
}
