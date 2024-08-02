import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crud/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  void onInit() {
    // TODO: implement onInit
    print("hfisodfh");
    super.onInit();
  }



  Future<void> signIn() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();

      print('Signed in: ${userCredential.user?.email}');
      final idToken = await userCredential.user?.getIdToken();
      final idUid = await userCredential.user?.uid;
      print('Signed in: ${idToken}');
      print('Signed in: ${idUid}');
      prefs.setString('loginUid',idUid!);
      Get.snackbar(
        'Success',
        'Signed in as ${userCredential.user?.email}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.off( () => HomeScreen());
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'invalid-email':
          errorMessage = 'The email address is badly formatted.';
          break;
        case 'user-disabled':
          errorMessage = 'The user corresponding to the given email has been disabled.';
          break;
        case 'user-not-found':
          errorMessage = 'There is no user corresponding to the given email.';
          break;
        case 'wrong-password':
          errorMessage = 'The password is invalid for the given email.';
          break;
        default:
          errorMessage = 'An unknown error occurred.';
      }
      print('Error: $e');
      Get.snackbar(
        'Error',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        'Error',
        'An unknown error occurred.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();


  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // The user canceled the sign-in
        print('Sign-in canceled by the user.');
        return;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser
          .authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with the credential
      final UserCredential userCredential = await _auth.signInWithCredential(
          credential);

      // Print user details and token
      final idToken = await userCredential.user?.getIdToken();
      print('Signed in: ${userCredential.user?.email}');
      print('ID Token: $idToken');

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Signed in as ${userCredential.user?.email}\nToken: $idToken'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
