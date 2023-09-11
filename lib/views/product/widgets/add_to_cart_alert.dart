import 'package:audiohub/controllers/add_to_cart/qty_controller.dart';
import 'package:audiohub/models/buy_now.dart';
import 'package:audiohub/service/firebase/add_to_cart.dart';
import 'package:audiohub/utils/constants/app_constants.dart';
import 'package:audiohub/views/checkout/checkout.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddToCartAlert extends StatelessWidget {
  const AddToCartAlert({
    super.key,
    required this.snapshot,
    required this.productId,
    this.buynow = false,
  });
  final AsyncSnapshot<Map<String, dynamic>?> snapshot;
  final String productId;
  final bool buynow;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'ADD TO CART',
        style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: kwidth * 0.14, vertical: kheight * 0.01),
      content: ChangeNotifierProvider(
        create: (BuildContext context) => CartQuatity(),
        child: Consumer<CartQuatity>(
          builder: (context, value, child) => SizedBox(
            height: kheight * 0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  snapshot.data!['name'],
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
                          InkWell(
                            onTap: () => value.increment(snapshot.data!['price']),
                            child: incAndDecButton(icon: Icons.add),
                          ),
                          Text(
                            value.quantity.toString(),
                            style: GoogleFonts.inter(fontSize: 20),
                          ),
                          InkWell(
                            onTap: () => value.decrement(snapshot.data!['price']),
                            child: incAndDecButton(icon: Icons.remove),
                          )
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
                    SizedBox(
                      width: kwidth * 0.05,
                    ),
                    Text(
                      value.cost == 0
                          ? numberformat.format(snapshot.data!['price'])
                          : numberformat.format(value.cost),
                      style: GoogleFonts.inter(color: Colors.black),
                    )
                  ],
                ),
                addtocartbutton(context),
              ],
            ),
          ),
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
        ),
      ),
    );
  }

  Widget addtocartbutton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          final qty = Provider.of<CartQuatity>(context, listen: false).quantity;
          if (buynow) {
            BuyNow.name = snapshot.data!['name'];
            BuyNow.price = snapshot.data!['price'];
            BuyNow.quantity = qty;
            BuyNow.image = snapshot.data!['image'][0];
            BuyNow.productId = productId;
            Navigator.of(context).pop();

            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CheckOutScrn(
                buyNow: true,
              ),
            ));
          } else {
            CartServices().addToCart(
              productId: productId,
              quantity: qty,
              context: context,
            );
            Navigator.of(context).pop();
          }
        },
        style: ButtonStyle(
            fixedSize: MaterialStatePropertyAll(Size(kwidth * 0.5, kheight * 0.02)),
            backgroundColor: const MaterialStatePropertyAll(Colors.black),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            )),
        child: Text(
          buynow ? 'BUY NOW' : 'Add to cart',
          style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold),
        ));
  }
}
