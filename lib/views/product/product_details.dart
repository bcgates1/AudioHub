import 'package:audiohub/controllers/wishlist/wishlist_controller.dart';
import 'package:audiohub/service/firebase/fetchdata.dart';
import 'package:audiohub/views/common_widgets/appbar.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:audiohub/views/product/widgets/add_to_cart_alert.dart';
import 'package:audiohub/views/product/widgets/scrolling_part.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppbarCom(
          title: 'Product',
          action: [
            Consumer<WishListController>(
              builder: (ctx, value, child) => IconButton(
                onPressed: () async {
                  if (!value.wishList.contains(productId)) {
                    await value.addWishList(productId: productId, context: context);
                  } else {
                    await value.deleteWishList(productId: productId, context: context);
                  }
                },
                icon: value.wishList.contains(productId)
                    ? const Icon(
                        Icons.favorite,
                        size: 28,
                        color: Color.fromARGB(255, 216, 76, 66),
                      )
                    : const Icon(
                        Icons.favorite_border,
                        size: 28,
                        color: Colors.black,
                      ),
              ),
            ),
          ],
        ),
        body: FutureBuilder(
            future: FetchDataFirebase.fetchProductWithId(productId: productId),
            builder: (context, snapshot) => snapshot.hasData
                ? Column(
                    children: [
                      ProductScrollingPart(
                        snapshot: snapshot,
                      ),
                      SizedBox(
                        height: kheight * 0.08,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AddToCartAlert(
                                    snapshot: snapshot,
                                    productId: productId,
                                    buynow: true,
                                  ),
                                );
                              },
                              style: _buttonstyle(),
                              child: _buttonchild('BUY NOW'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AddToCartAlert(
                                    snapshot: snapshot,
                                    productId: productId,
                                  ),
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
