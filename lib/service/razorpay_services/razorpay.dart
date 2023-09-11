import 'package:audiohub/controllers/cart/cart.dart';
import 'package:audiohub/controllers/checkout/address_selector.dart';
import 'package:audiohub/service/firebase/add_to_cart.dart';
import 'package:audiohub/service/firebase/create_order.dart';
import 'package:audiohub/views/checkout/order_placed.dart';
import 'package:audiohub/views/common_widgets/alert_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayService {
  final _razorpay = Razorpay();
  final _razorpayKey = 'rzp_test_9lXnCWRvV6cdUO';
  late BuildContext context;
  bool buynow = false;

  //initialization of razorpay
  void razorpayInitialize(BuildContext context) {
    this.context = context;
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    final AddressSelector address = Provider.of<AddressSelector>(context, listen: false);

    if (buynow) {
      await CreateOrder().createorderBuyNow(address: address);
    } else {
      final CartController cartItems = Provider.of<CartController>(context, listen: false);
      await CreateOrder().createorder(cartItems: cartItems, address: address);
    }
    await CartServices().clearCart();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OrderPlaced()));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    snackbarMessage(message: 'Payment Failed', context: context);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    snackbarMessage(message: 'External Wallet Selected', context: context);
  }

//razorpay checkout
  void razorpayCheckout({
    required num amount,
    bool isBuyNow = false,
  }) {
    buynow = isBuyNow;
    final options = {
      'key': _razorpayKey,
      'amount': amount * 100,
      'currency': 'INR',
      'name': 'AudioHub',
      'description': 'Payment for AudioHub',
      'prefill': {'email': 'bcemailid@gmail.com', 'contact': '1234567890'},
      'theme': {
        'color': '#FFFFFF',
      },
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      alertshower(message: e.toString(), context: context);
    }
  }
}
