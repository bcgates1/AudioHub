import 'package:audiohub/views/cart/widgets/cart_tile.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => const CartTile(),
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: 3),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: kheight * 0.2),
                Text(
                  'PRICE DETAILS',
                  style: GoogleFonts.inter(color: Colors.black),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SUBTOTAL',
                          style: GoogleFonts.inter(color: Colors.black),
                        ),
                        Text('DELIVERY FEE', style: GoogleFonts.inter(color: Colors.black))
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('₹86,970', style: GoogleFonts.inter(color: Colors.black)),
                        Text('₹0.00', style: GoogleFonts.inter(color: Colors.black))
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: kwidth * 0.05),
                    child: Container(
                      height: 50,
                      color: Colors.black,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: kwidth * 0.08),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: GoogleFonts.inter(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            Text('₹86,970',
                                style: GoogleFonts.inter(
                                    color: Colors.white, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
