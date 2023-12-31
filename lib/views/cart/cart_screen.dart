import 'package:audiohub/views/cart/widgets/cart_checkout.dart';
import 'package:audiohub/views/cart/widgets/cart_itemlist.dart';
import 'package:audiohub/views/common_widgets/appbar.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: AppbarCom(title: 'Cart'),
        body: Column(
          children: [
            Flexible(
              child: CartItems(),
            ),
            CartCheckOut(),
          ],
        ),
      ),
    );
  }
}
