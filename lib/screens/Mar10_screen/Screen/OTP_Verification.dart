import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/screens/Mar10_screen/services/phone_number_auth.dart';
import 'package:project1/screens/feb3_screen/phone_directory_screen_feb3.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key, required this.phoneNumber}) : super(key: key);
  final String phoneNumber;

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  final otpVerifyController = Get.put(PhoneNumberAuth());

  @override
  void initState() {
    // TODO: implement initState
    otpVerifyController.verifyPhoneNumber(widget.phoneNumber);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("OTP Verification"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 100.0,),
              TextFormField(
                controller: otpController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter OTP';
                  } else if (value.length < 6) {
                    return 'Enter valid OTP';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "XXX XXX",
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
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          });
                      otpVerifyController.signInWithPhoneNumber(otpController.text).then((value) => Get.back())
                          .then((value) => Get.off(() => const PhoneScreen()));
                    }
                  },
                  child: const Text(
                    "Verify",
                    style: TextStyle(fontSize: 16.0),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
