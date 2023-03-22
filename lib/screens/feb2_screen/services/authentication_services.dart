import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project1/screens/feb3_screen/phone_directory_screen_feb3.dart';

class AuthenticationService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  // facebook authentication
  Future<void> signInFacebook(BuildContext context) async{
    // Map<String, dynamic> _userData;
    // AccessToken _accessToken;
    // bool _isLogedin = true;

    final LoginResult result = await _facebookAuth.login();
    if(result.status == LoginStatus.success){
      final AccessToken accessToken = result.accessToken!;

      final AuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(accessToken.token);
      print("CREDENTIAL>>>>> ${accessToken.token}");

      _firebaseAuth.signInWithCredential(facebookAuthCredential);

      if(accessToken != null){
        print("FACEBOOK>>>>> ${accessToken.toJson()}");

        final userData = await _facebookAuth.getUserData();
        print("ACCESSTOKEN>>>>> ${accessToken.token}");
        print("USERDATA>>>>> $userData");
        Get.offAll(() => const PhoneScreen());
      }

      print("STATUS>>>>> ${result.status}");
      print("MSG>>>>> ${result.message}");
    }
  }

  // facebook signOut
  Future<void> fbSignOut() async{
    try {
      await _facebookAuth.logOut();
      print("SignOut Successful from FB!!! ${_facebookAuth.accessToken}");
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  // SignIn with Google
  Future<void> signInGoogle(BuildContext context) async{
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    if(googleSignInAccount != null){
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      UserCredential result = await _firebaseAuth.signInWithCredential(authCredential);
      User? user = result.user;
      print("USER>>>>>>>>>> ${user}");
      print("AccessToken>>>>>>>>>> ${googleSignInAuthentication.accessToken}");
      print("EMAIL>>>>>>>>>> ${_firebaseAuth.currentUser?.email}");


      if(result != null){
        Get.offAll(() => const PhoneScreen());
      }
    }
  }

  // SignOut
  Future<void> signOut() async{
    try {
      await _firebaseAuth.signOut();
      print("SignOut Successful!!! ${_firebaseAuth.currentUser}");
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  // Get Current User
  User? getUser() {
    try{
      print("EMAIL>>>>>>>>>> ${_firebaseAuth.currentUser?.email}");
      print("Display>>>>>>>>>> ${_firebaseAuth.currentUser?.providerData[0].providerId}");
      return _firebaseAuth.currentUser;
    } on FirebaseAuthException catch(e) {
      print(e.message);
    }
  }
}