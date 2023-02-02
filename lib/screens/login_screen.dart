import 'package:flutter/material.dart';
import 'package:project1/screens/first_demo_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;

  @override
  void dispose() {
    // TODO: implement dispose
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          // height: double.infinity,
          // width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.deepOrangeAccent,
              Colors.orangeAccent,
              Colors.orange
            ], begin: Alignment(1, -1), end: Alignment(-1, 1)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // appbar for back arrow and register
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 30.0,
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Register",
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                ),
              ),

              // Sign In Text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    left: 30.0, right: 30.0, bottom: 50.0, top: 20.0),
                child: Text(
                  "Welcome to the application",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),

              // form container
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20.0),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Username textFormField
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30.0),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(40.0)),
                            child: TextFormField(
                              controller: usernameController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter username';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: 'Username',
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                ),
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),

                        // password textFormField
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: TextFormField(
                              controller: passwordController,
                              textInputAction: TextInputAction.next,
                              obscureText: obscureText,
                              // keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Password',
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: Colors.grey,
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                ),
                                focusedErrorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                ),
                                hintStyle: const TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      obscureText = !obscureText;
                                    });
                                  },
                                  child: Icon(
                                    obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // forgot password button
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(color: Colors.black),
                              )),
                        ),

                        // SignIn Button
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const FirstDemoScreen()));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(70),
                                elevation: 3,
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0))),
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 16.0),
                            ),
                          ),
                        ),

                        // Google button
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30.0),
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 50.0,
                                    width: 50.0,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        image: NetworkImage("https://blog.hubspot.com/hubfs/image8-2.jpg"),
                                        fit: BoxFit.cover
                                      ),
                                      borderRadius: BorderRadius.circular(40.0)
                                    ),
                                  ),
                                  const Text("Continue with Google", style: TextStyle(fontWeight: FontWeight.bold)),
                                  const Icon(Icons.arrow_forward, size: 26.0,)
                                ],
                              )),
                        ),

                        // Facebook button
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 50.0,
                                  width: 50.0,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/0/05/Facebook_Logo_%282019%29.png"),
                                          fit: BoxFit.cover
                                      ),
                                      borderRadius: BorderRadius.circular(40.0)
                                  ),
                                ),
                                const Text("Continue with Facebook", style: TextStyle(fontWeight: FontWeight.bold)),
                                const Icon(Icons.arrow_forward, size: 26.0,)
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
