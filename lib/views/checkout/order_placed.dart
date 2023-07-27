import 'dart:async';
import 'package:audiohub/views/core/style.dart';
import 'package:audiohub/views/home/main_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class OrderPlaced extends StatelessWidget {
  const OrderPlaced({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: kwidth,
          child: LottieBuilder.asset('assets/lotties/Orderplaced.json',
              onLoaded: (p0) => wait(context),
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '😢',
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      'Something Error',
                      style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.black),
                    )
                  ],
                );
              },
              fit: BoxFit.fitWidth),
        ),
      ),
    );
  }

  wait(BuildContext context) {
    Timer(const Duration(milliseconds: 3000), () {
      Navigator.pushAndRemoveUntil<void>(
        context,
        MaterialPageRoute<void>(builder: (BuildContext context) => const Home()),
        ModalRoute.withName('/'),
      );
    });
  }
}
