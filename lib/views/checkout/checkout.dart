import 'package:audiohub/views/checkout/order_placed.dart';
import 'package:audiohub/views/checkout/widgets/payment_part.dart';
import 'package:audiohub/views/checkout/widgets/scrolling_part.dart';
import 'package:audiohub/views/common_widgets/appbar.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOutScrn extends StatelessWidget {
  const CheckOutScrn({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarCom(title: 'Checkout'),
        body: Column(
          children: [
            const ScrollingPart(),
            const PaymentPart(),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'TOTAL',
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(
                  '₹57980',
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.black),
                )
              ],
            ),
            SizedBox(height: kheight * 0.01),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const OrderPlaced()));
              },
              style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size(kwidth * 0.6, kheight * 0.01)),
                  backgroundColor: const MaterialStatePropertyAll(Colors.black),
                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                  shape: const MaterialStatePropertyAll(ContinuousRectangleBorder())),
              child: const Text(
                'PLACE ORDER',
              ),
            ),
            SizedBox(height: kheight * 0.01),
          ],
        ),
      ),
    );
  }
}
