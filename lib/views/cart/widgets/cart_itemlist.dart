import 'dart:developer';

import 'package:audiohub/controllers/cart/cart.dart';
import 'package:audiohub/views/cart/widgets/cart_tile.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<CartController>(context, listen: false);

    return WillPopScope(
      onWillPop: () async {
       await value.addtocart(context: context);
        return true;
      },
      child: FutureBuilder(
        future: value.initializeAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.data == true) {
            return const Center(
              child: Text('Add products to cart'),
            );
          } else {
            return Consumer<CartController>(builder: (context, value, child) {
              return value.cartQuantity.isNotEmpty
                  ? Column(
                      children: [
                        SizedBox(
                          height: kheight * 0.52,
                          child: SingleChildScrollView(
                            child: ListView.separated(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kwidth * 0.03, vertical: kheight * 0.01),
                              itemCount: value.cartQuantity.length,
                              shrinkWrap: true,
                              separatorBuilder: (context, index) => const Divider(),
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => CartTile(
                                imgpath: value.allProduct[index]['image'][0],
                                name: value.allProduct[index]['name'],
                                price: value.allProduct[index]['price'] *
                                    value.cartQuantity[index]['quantity'],
                                quantity: value.cartQuantity[index]['quantity'],
                                productId: value.cartQuantity[index]['productId'],
                                index: index,
                                value: value,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                      Text('DELIVERY FEE',
                                          style: GoogleFonts.inter(color: Colors.black))
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        value.totalPrice.toString(),
                                        style: GoogleFonts.inter(color: Colors.black),
                                      ),
                                      Text('₹0.00', style: GoogleFonts.inter(color: Colors.black))
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 20),
                              Padding(
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
                                        Text(value.totalPrice.toString(),
                                            style: GoogleFonts.inter(
                                                color: Colors.white, fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30)
                            ],
                          ),
                        ),
                      ],
                    )
                  : const Center(
                      child: Text(
                        'Add products to cart',
                      ),
                    );
            });
          }
        },
      ),
    );
  }
}
