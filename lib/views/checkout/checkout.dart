import 'package:audiohub/controllers/cart/cart.dart';
import 'package:audiohub/controllers/checkout/address_selector.dart';
import 'package:audiohub/controllers/checkout/payment_selector/payment_selector.dart';
import 'package:audiohub/models/buy_now.dart';
import 'package:audiohub/service/firebase/add_to_cart.dart';
import 'package:audiohub/service/firebase/create_order.dart';
import 'package:audiohub/service/razorpay_services/razorpay.dart';
import 'package:audiohub/utils/constants/app_constants.dart';
import 'package:audiohub/views/checkout/order_placed.dart';
import 'package:audiohub/views/checkout/widgets/payment_part.dart';
import 'package:audiohub/views/checkout/widgets/scrolling_part.dart';
import 'package:audiohub/views/common_widgets/alert_widgets.dart';
import 'package:audiohub/views/common_widgets/appbar.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckOutScrn extends StatelessWidget {
  CheckOutScrn({super.key, this.buyNow = false});
  final RazorPayService razorPayService = RazorPayService();
  final bool buyNow;

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context, listen: false);
    final paymentSelector = Provider.of<PaymentSelector>(context, listen: false);
    razorPayService.razorpayInitialize(context);

    return SafeArea(
      child: Scaffold(
        appBar: const AppbarCom(title: 'Checkout'),
        body: Column(
          children: [
            ScrollingPart(buyNow: buyNow),
            const PaymentPart(),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'TOTAL',
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(
                  numberformat.format(
                    buyNow ? (BuyNow.price! * BuyNow.quantity!) : cartController.totalPrice,
                  ),
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.black),
                )
              ],
            ),
            SizedBox(height: kheight * 0.01),
            ElevatedButton(
              onPressed: () async {
                final AddressSelector address =
                    Provider.of<AddressSelector>(context, listen: false);
                if (address.addressList.isEmpty) {
                  toastMessage(message: 'Please add address');
                } else {
                  if (paymentSelector.israzorpay) {
                    razorPayService.razorpayCheckout(
                      amount:
                          buyNow ? (BuyNow.price! * BuyNow.quantity!) : cartController.totalPrice,
                      isBuyNow: buyNow,
                    );
                  } else {
                    if (buyNow) {
                      await CreateOrder().createorderBuyNow(address: address, cod: true);
                    } else {
                      await CreateOrder()
                          .createorder(cartItems: cartController, address: address, cod: true);
                      await CartServices().clearCart();
                    }
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => const OrderPlaced()));
                  }
                }
              },
              style: ButtonStyle(
                fixedSize: MaterialStatePropertyAll(Size(kwidth * 0.7, kheight * 0.02)),
                backgroundColor: const MaterialStatePropertyAll(Colors.black),
                foregroundColor: const MaterialStatePropertyAll(Colors.white),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: const Text(
                'PLACE ORDER',
              ),
            ),
            SizedBox(height: kheight * 0.01),
          ],
        ),
      ),
    );
  }
}
