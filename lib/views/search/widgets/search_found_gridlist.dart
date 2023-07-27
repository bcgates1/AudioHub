import 'package:audiohub/views/common_widgets/item_card.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:flutter/material.dart';

class SearchFoundGrid extends StatelessWidget {
  const SearchFoundGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: kheight * 0.32,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      padding: const EdgeInsets.all(5),
      itemBuilder: (context, index) => ItemCard(imagepath: imgpath, discount: 70, price: 28990),
      itemCount: 10,
    );
  }
}
