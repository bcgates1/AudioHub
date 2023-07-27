import 'package:audiohub/views/core/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutItemTile extends StatelessWidget {
  const CheckoutItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kheight * 0.1,
      child: Row(
        children: [
          Container(
            width: kheight * 0.1,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(kheight * 0.01),
                border: Border.all(color: Colors.grey),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      imgpath,
                    ))),
          ),
          SizedBox(
            width: kwidth * 0.06,
          ),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sony WH-1000XM5', style: GoogleFonts.inter(color: Colors.black)),
                Text(
                  '₹28990',
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Container(
                  height: kheight * 0.024,
                  width: kwidth * 0.128,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kwidth * 0.05), border: Border.all()),
                  child: Center(
                    child: Text(
                      '1',
                      style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
