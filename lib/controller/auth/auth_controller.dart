import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  //? auth controller intance
  static AuthController instance = Get.find();

  late Rx<User?> _user;

  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSign = GoogleSignIn();

  late Rx<GoogleSignInAccount?> _googleSignInAccount;
  var isNotLoding = true.obs;

  @override
  void onReady() {
    super.onReady();

    _user = Rx<User?>(auth.currentUser);
    _googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);

    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);

    _googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    ever(_googleSignInAccount, _initialScreenGoogle);
  }

  //* method to decide which page to show
  _initialScreen(User? user) {
    if (user == null) {
      //? if the user is not found then the user is navigated to the Register Screen
      Get.offAllNamed("/onboard");
    } else {
      //? if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAllNamed("/home");
    }
  }

  _initialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    if (googleSignInAccount == null) {
      //? if the user is not found then the user is navigated to the Register Screen
      Get.offAllNamed("/onboard");
    } else {
      //? if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAllNamed("/home");
    }
  }

  void register(String email, password) async {
    try {
      isNotLoding(false);
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await Future.delayed(const Duration(seconds: 2));
      isNotLoding(true);
    } catch (firebaseAuthException) {
      Get.snackbar("Failed to Register", "Something went wrong!",
          colorText: Colors.white,
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          borderRadius: 10);
      isNotLoding(true);
    }
  }

  void login(String email, password) async {
    try {
      isNotLoding(false);
      await auth.signInWithEmailAndPassword(email: email, password: password);
      await Future.delayed(const Duration(seconds: 2));
      isNotLoding(true);
    } catch (firebaseAuthException) {
      Get.snackbar("Failed to Login", "Something went wrong!",
          colorText: Colors.white,
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          borderRadius: 10);
      isNotLoding(true);
    }
  }

  void signOut() async {
    await auth.signOut();
  }

//* gooogle
  void signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await auth.signInWithCredential(credential).catchError((onErr) => {});
      }
    } catch (e) {
      print(e);
      Get.snackbar("Failed to Login", "Something went wrong!",
          colorText: Colors.white,
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          borderRadius: 10);
    }
  }

  //* reset password

  Future resetpass(String email) async {
    try {
      isNotLoding(false);
      await auth.sendPasswordResetEmail(email: email).then((value) =>
          Get.snackbar("Email sent to you email", "check your email",
              colorText: Colors.white,
              isDismissible: true,
              dismissDirection: DismissDirection.horizontal,
              borderRadius: 10));

      isNotLoding(true);
    } catch (e) {
      Get.snackbar("Failed to send email", "Something went wrong!",
          colorText: Colors.white,
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          borderRadius: 10);

      isNotLoding(true);
    }
  }
}
