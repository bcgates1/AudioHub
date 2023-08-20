import 'package:audiohub/views/checkout/checkout.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartCheckOut extends StatelessWidget {
  const CartCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      height: kheight * 0.08,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const CheckOutScrn()));
          },
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(Colors.white),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text('CHECKOUT',
                style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.black)),
          ),
        ),
      ),
    );
  }
}
