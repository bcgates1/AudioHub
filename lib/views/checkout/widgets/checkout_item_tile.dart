import 'package:audiohub/utils/constants/app_constants.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutItemTile extends StatelessWidget {
  const CheckoutItemTile({
    super.key,
    required this.name,
    required this.imgpath,
    required this.price,
    required this.quantity,
    required this.productId,
  });
  final String name;
  final String imgpath;
  final int price;
  final int quantity;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SizedBox(
        width: kwidth * 0.2,
        height: kheight * 0.2,
        child: Image.network(
          imgpath,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(
        name,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            numberformat.format(price),
          ),
          Text(
            'Total ${numberformat.format(price * quantity)} ',
          )
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Quantity'),
          SizedBox(width: kwidth * 0.02),
          Container(
            height: kheight * 0.03,
            width: kwidth * 0.09,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.lerp(
                  const BorderRadius.all(Radius.circular(10)), BorderRadius.circular(50), 0.5),
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: Text(
                '$quantity',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
