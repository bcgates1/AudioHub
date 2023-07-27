import 'package:audiohub/views/common_widgets/item_card.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:audiohub/views/home/widget/carousel.dart';
import 'package:audiohub/views/product/product_details.dart';
import 'package:flutter/material.dart';

class AllScreens extends StatelessWidget {
  const AllScreens({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: CarouselHome(),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: MediaQuery.of(context).size.width * .7,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const ProductDetails()));
              },
              child: ItemCard(imagepath: imgpath, discount: 70, price: 28990),
            ),
            itemCount: 10,
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
