import 'package:audiohub/views/common_widgets/appbar.dart';
import 'package:audiohub/views/common_widgets/item_card.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:audiohub/views/product/product_details.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarCom(title: 'Wishlist'),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: kheight * 0.32,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const ProductDetails()));
            },
            child: ItemCard(imagepath: imgpath, discount: 70, price: 28990),
          ),
          padding: const EdgeInsets.all(8),
          itemCount: 3,
        ),
      ),
    );
  }
}
