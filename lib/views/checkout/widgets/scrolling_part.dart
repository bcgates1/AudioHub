import 'package:audiohub/controllers/cart/cart.dart';
import 'package:audiohub/views/checkout/widgets/address_adding.dart';
import 'package:audiohub/views/checkout/widgets/checkout_item_tile.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScrollingPart extends StatelessWidget {
  const ScrollingPart({super.key});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<CartController>(context, listen: false);

    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kwidth * 0.05, vertical: kheight * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shipping Address',
                style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: kheight * 0.01),
              InkWell(
                onTap: () {
                  _addAddress(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kheight * 0.01),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  height: kheight * 0.15,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.add_location_alt_outlined,
                          color: Colors.grey,
                        ),
                        Text(
                          'Add location',
                          style: GoogleFonts.inter(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: kheight * 0.01),
              Text(
                'Order list',
                style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: kheight * 0.01),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.cartQuantity.length,
                itemBuilder: (context, index) {
                  return CheckoutItemTile(
                    imgpath: value.allProduct[index]['image'][0],
                    name: value.allProduct[index]['name'],
                    price: value.allProduct[index]['price'],
                    quantity: value.cartQuantity[index]['quantity'],
                    productId: value.cartQuantity[index]['productId'],
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _addAddress(BuildContext context) {
    return showModalBottomSheet(
        useSafeArea: true,
        context: context,
        constraints: BoxConstraints(minWidth: kwidth),
        isScrollControlled: true,
        backgroundColor: Colors.black,
        builder: (context) {
          return const AddressAdding();
        });
  }
}
