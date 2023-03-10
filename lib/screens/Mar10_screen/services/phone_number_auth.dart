import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:project1/screens/feb3_screen/phone_directory_screen_feb3.dart';

class PhoneNumberAuth extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _verificationId = "";
  String? otp;
  String authStatus = "";
  int? _resendToken;

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: '+91$phoneNumber',
          timeout: const Duration(seconds: 60),
          verificationCompleted: (AuthCredential credential) async {
            await _firebaseAuth.signInWithCredential(credential).then((value) {
              Get.off(() => const PhoneScreen());
              authStatus = "Your account is successfully verified";
              print(authStatus);
              update();
            });
          },
          verificationFailed: (FirebaseAuthException exception) {
            print("Error>>>> ${exception.message}");
            authStatus = "Authentication failed";
            print(authStatus);
            update();
          },
          codeSent: (String verificationId, int? resendToken) {
            _verificationId = verificationId;
            authStatus = "OTP has been successfully send";
            print(authStatus);
            _resendToken = resendToken;
            authStatus = "Resend OTP has been successfully";
            print(authStatus);
            update();
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            _verificationId = verificationId;
            authStatus = "TIMEOUT";
            print(authStatus);
            update();
          });
    } catch (e) {
      print("ERROR++++++ $e");
    }
  }

  Future<void> signInWithPhoneNumber(String otp) async {
    await _firebaseAuth.signInWithCredential(PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: otp));
  }
}
