import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/screens/Mar10_screen/Screen/OTP_Verification.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({Key? key}) : super(key: key);

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Phone Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 100.0,),
              TextFormField(
                controller: phoneNumberController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter number';
                  } else if (value.length < 10) {
                    return 'Enter valid mobile number';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "+91 XXXXX XXXXX",
                  hintStyle: TextStyle(fontSize: 14),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(13.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(13.0)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(13.0)),
                  ),
                ),
              ),
              const SizedBox(height: 50.0,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60.0),
                ),
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      _formKey.currentState!.save();
                      Get.off(() => OTPVerification(phoneNumber: phoneNumberController.text,));
                    }
                  },
                  child: const Text(
                    "Send OTP",
                    style: TextStyle(fontSize: 16.0),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
