import 'package:audiohub/service/firebase/fetchdata.dart';
import 'package:audiohub/views/checkout/checkout.dart';
import 'package:audiohub/views/common_widgets/appbar.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:audiohub/views/product/widgets/add_to_cart_alert.dart';
import 'package:audiohub/views/product/widgets/scrolling_part.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const AppbarCom(title: 'Product'),
        body: FutureBuilder(
            future: FetchDataFirebase.fetchProductWithId(productId: productId),
            builder: (context, snapshot) => snapshot.hasData
                ? Column(
                    children: [
                       ProductScrollingPart(snapshot: snapshot,),
                      SizedBox(
                        height: kheight * 0.08,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => const CheckOutScrn()));
                              },
                              style: _buttonstyle(),
                              child: _buttonchild('BUY NOW'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => const AddToCartAlert(),
                                );
                              },
                              style: _buttonstyle(),
                              child: _buttonchild('ADD TO CART'),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  )),
      ),
    );
  }

  ButtonStyle _buttonstyle() {
    return ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Colors.black),
        foregroundColor: const MaterialStatePropertyAll(Colors.white),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));
  }

  Widget _buttonchild(String text) {
    return SizedBox(
      height: kheight * 0.06,
      width: kwidth * 0.28,
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
