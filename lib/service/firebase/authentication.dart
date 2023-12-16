import 'package:audiohub/controllers/wishlist/wishlist_controller.dart';
import 'package:audiohub/service/firebase/notification_services.dart';
import 'package:audiohub/views/common_widgets/toast.dart';
import 'package:audiohub/views/home/main_home.dart';
import 'package:audiohub/views/login/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Auth {
  Auth({required this.context});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final BuildContext context;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future signupwithemailid({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then(
        (value) async {
          _firestore.collection('users').doc(value.user!.uid).set(
            {
              'email': email,
              'username': username,
            },
          );
          await Provider.of<WishListController>(context, listen: false).getWishList();
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));
          await FirebaseNotificationServices.getDeviceToken();
          toastMessage(message: 'Succefully Signed Up');
        },
      );
    } on FirebaseException catch (e) {
      toastMessage(message: e.message.toString());
      Navigator.of(context).pop();
      // Navigator.pop(context);
    }
  }

  Future signinwithemail({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) async {
        await Provider.of<WishListController>(context, listen: false).getWishList();
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));
        toastMessage(message: 'Welcome Back');
        await FirebaseNotificationServices.getDeviceToken();
      });
    } on FirebaseException catch (e) {
      if (e.message == 'The email address is badly formatted.') {
        toastMessage(message: 'User not found');
      } else {
        toastMessage(message: e.message.toString());
      }
    }
  }

  Future signwithgoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      await _auth.signInWithCredential(credential).then(
        (value) async {
          _firestore.collection('users').doc(value.user!.uid).set(
            {
              'email': value.user!.email,
              'username': value.user!.displayName,
              'userImage': value.user!.photoURL,
            },
          );
          await Provider.of<WishListController>(context, listen: false).getWishList();

          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));
          await FirebaseNotificationServices.getDeviceToken();

          toastMessage(message: 'Welcome Back');
        },
      );
    } on FirebaseException catch (e) {
      toastMessage(message: e.message.toString());
    }
  }

  void firebasesignout() {
    try {
      _auth.signOut();
      toastMessage(message: 'Signed Out');
      //when signout screen need to go to login screen
      Navigator.pushAndRemoveUntil<void>(
        context,
        MaterialPageRoute<void>(builder: (BuildContext context) => const Login()),
        ModalRoute.withName('/'),
      );
    } catch (e) {
      toastMessage(message: e.toString());
    }
  }
}
