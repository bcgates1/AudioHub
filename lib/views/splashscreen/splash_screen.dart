import 'dart:async';
import 'package:audiohub/views/home/main_home.dart';
import 'package:audiohub/views/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      wait(context);
    });
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    ));
  }

  wait(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Timer(
        const Duration(milliseconds: 2000),
        () {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => const Home()));
        },
      );
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Login()));
    }
  }
}
