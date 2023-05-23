import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mad_cw2_vet_me/screens/authentication/opening-screen-default.dart';

import '../screens/authentication/login-screen.dart';

class AuthenticationController extends ChangeNotifier{

  List<bool> isSelected = <bool>[true, false];

  onToggle(){
    for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
      isSelected[buttonIndex] = !isSelected[buttonIndex];
      notifyListeners();
    }
  }

  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            // if the user is a pet owner direct to pet owner dashboard or clinic dashboard
            return const DefaultOpeningScreen();
          } else {
            return const Login();
          }
        });
   }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password
  }) async {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password
  }) async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);

  }

  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

}