import 'package:audiohub/controllers/cart/cart.dart';
import 'package:audiohub/service/firebase/add_to_cart.dart';
import 'package:audiohub/utils/constants/app_constants.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    super.key,
    required this.name,
    required this.imgpath,
    required this.price,
    required this.quantity,
    required this.productId,
    required this.index,
    required this.value,
  });
  final String name;
  final String imgpath;
  final int price;
  final int quantity;
  final String productId;
  final int index;
  final CartController value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: kheight * 0.1,
          width: kwidth * 0.2,
          child: Image.network(
            imgpath,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          width: kwidth * 0.05,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: GoogleFonts.inter(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              numberformat.format(price),
              style: GoogleFonts.inter(color: Colors.black),
            )
          ],
        ),
        Expanded(
          child: SizedBox(
            width: kwidth * 0.1,
          ),
        ),
        SizedBox(
          width: kwidth * 0.23,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => value.increment(index: index),
                child: incAndDecButton(icon: Icons.add),
              ),
              Text(
                quantity.toString(),
                style: GoogleFonts.inter(fontSize: 20),
              ),
              GestureDetector(
                onTap: () {
                  if (quantity > 1) {
                    value.decrement(index: index);
                  }
                },
                child: incAndDecButton(icon: Icons.remove),
              ),
            ],
          ),
        ),
        SizedBox(
          width: kwidth * 0.05,
        ),
        InkWell(
          onTap: () async {
            await CartServices().removeFromCart(productId: productId, context: context);
            value.deleteitem(index: index);
          },
          child: const Icon(Icons.delete),
        )
      ],
    );
  }

  Widget incAndDecButton({required IconData icon}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.5),
      child: ColoredBox(
        color: Colors.black,
        child: SizedBox(
          width: 25,
          height: 25,
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
