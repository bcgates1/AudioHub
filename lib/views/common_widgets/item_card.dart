import 'package:audiohub/controllers/wishlist/wishlist_controller.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  ItemCard(
      {super.key,
      required this.imagepath,
      required this.discount,
      required this.price,
      required this.name,
      required this.category,
      required this.productId});
  final String name;
  final String imagepath;
  final int discount;
  final int price;
  final String category;
  final String productId;
  final NumberFormat numberformat = NumberFormat.simpleCurrency(locale: 'en_IN', decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                  width: kwidth * 0.5, height: kheight * 0.2, fit: BoxFit.fitHeight, imagepath),
              Positioned(
                right: 0,
                child: Consumer<WishListController>(
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
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                    ),
                  ),
                  Text(category, style: GoogleFonts.inter(color: Colors.black)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$discount% OFF',
                        style: GoogleFonts.inter(color: Colors.green),
                      ),
                      SizedBox(
                        width: kwidth * 0.08,
                      ),
                      Flexible(
                        child: Text(
                          numberformat.format(price),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Text('Delivery in 5 days', style: GoogleFonts.inter(fontSize: 10)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
