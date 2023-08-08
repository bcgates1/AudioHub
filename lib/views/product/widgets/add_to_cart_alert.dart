import 'package:audiohub/views/core/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddToCartAlert extends StatelessWidget {
  const AddToCartAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'ADD TO CART',
        style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: kwidth * 0.1, vertical: kheight * 0.01),
      content: SizedBox(
        height: kheight * 0.2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Sony WH-1000XM5',
              style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Row(
              children: [
                Text(
                  'QTY  :',
                  style: GoogleFonts.inter(color: Colors.black),
                ),
                SizedBox(
                  width: kwidth * 0.05,
                ),
                SizedBox(
                  width: kwidth * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      incAndDecButton(icon: Icons.add),
                      Text(
                        '1',
                        style: GoogleFonts.inter(fontSize: 20),
                      ),
                      incAndDecButton(icon: Icons.remove)
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  'Cost :',
                  style: GoogleFonts.inter(color: Colors.black),
                ),
                Text(
                  ' ₹28990',
                  style: GoogleFonts.inter(color: Colors.black),
                )
              ],
            ),
            addtocartbutton(context),
          ],
        ),
      ),
    );
  }

  Widget incAndDecButton({required IconData icon}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kheight * 0.0125),
      child: ColoredBox(
          color: Colors.black,
          child: SizedBox(
            width: kheight * 0.025,
            height: kheight * 0.025,
            child: Icon(
              icon,
              color: Colors.white,
              size: kheight * 0.02,
            ),
          )),
    );
  }

  Widget addtocartbutton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        style: ButtonStyle(
            fixedSize: MaterialStatePropertyAll(Size(kwidth * 0.5, kheight * 0.02)),
            backgroundColor: const MaterialStatePropertyAll(Colors.black),
            shape: const MaterialStatePropertyAll(
              ContinuousRectangleBorder(),
            )),
        child: Text(
          'Add to cart',
          style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold),
        ));
  }
}
