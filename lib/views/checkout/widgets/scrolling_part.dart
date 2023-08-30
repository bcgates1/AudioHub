import 'package:audiohub/controllers/cart/cart.dart';
import 'package:audiohub/controllers/checkout/address_selector.dart';
import 'package:audiohub/models/buy_now.dart';
import 'package:audiohub/views/checkout/widgets/addressList.dart';
import 'package:audiohub/views/checkout/widgets/address_screen.dart';
import 'package:audiohub/views/checkout/widgets/checkout_item_tile.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScrollingPart extends StatelessWidget {
  const ScrollingPart({super.key, this.buyNow = false});
  final bool buyNow;

  @override
  Widget build(BuildContext context) {
    final cartControllervalue = Provider.of<CartController>(context, listen: false);

    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
              Consumer<AddressSelector>(
                builder: (context, addrselector, child) => FutureBuilder(
                    future: addrselector.fetchAddress(),
                    builder: (context, snapshot) {
                      if (snapshot.data == true && addrselector.addressList.isNotEmpty) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kheight * 0.01),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: ListTile(
                            title:
                                Text(addrselector.addressList[addrselector.selectedIndex]['name']),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(addrselector.addressList[addrselector.selectedIndex]
                                    ['houseNo']),
                                Text(addrselector.addressList[addrselector.selectedIndex]['city']),
                                Row(
                                  children: [
                                    Text(
                                        '${addrselector.addressList[addrselector.selectedIndex]['district']}, '),
                                    Text(
                                        '${addrselector.addressList[addrselector.selectedIndex]['state']}, '),
                                    Text(addrselector.addressList[addrselector.selectedIndex]
                                        ['pincode']),
                                  ],
                                ),
                                Text(addrselector.addressList[addrselector.selectedIndex]['mobile']
                                    .toString()),
                                Text(addrselector.addressList[addrselector.selectedIndex]
                                    ['landmark']),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //edit
                                GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => const AddressList())),
                                  child: const Icon(Icons.add),
                                )
                              ],
                            ),
                          ),
                        );
                      } else if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AddressScreen(),
                            ));
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
                                    'Add Address',
                                    style: GoogleFonts.inter(
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    }),
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
                itemCount: buyNow ? 1 : cartControllervalue.cartQuantity.length,
                itemBuilder: (context, index) {
                  return CheckoutItemTile(
                    imgpath: buyNow
                        ? BuyNow.image
                        : cartControllervalue.allProduct['$index']['image'][0],
                    name: buyNow ? BuyNow.name : cartControllervalue.allProduct['$index']['name'],
                    price:
                        buyNow ? BuyNow.price : cartControllervalue.allProduct['$index']['price'],
                    quantity: buyNow
                        ? BuyNow.quantity
                        : cartControllervalue.cartQuantity[index]['quantity'],
                    productId: buyNow
                        ? BuyNow.productId
                        : cartControllervalue.cartQuantity[index]['productId'],
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

  // Future<dynamic> _addAddress(BuildContext context) {
  //   return showModalBottomSheet(
  //       useSafeArea: true,
  //       context: context,
  //       constraints: BoxConstraints(minWidth: kwidth),
  //       isScrollControlled: true,
  //       backgroundColor: Colors.black,
  //       builder: (context) {
  //         return const AddressAdding();
  //       });
  // }
}
