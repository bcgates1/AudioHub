import 'package:audiohub/controllers/search/search_ctrl.dart';
import 'package:audiohub/views/common_widgets/item_card.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:audiohub/views/product/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchFoundGrid extends StatelessWidget {
  const SearchFoundGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCtrl = Provider.of<SearchCtrl>(context);
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: kheight * 0.32,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      padding: const EdgeInsets.all(5),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  ProductDetails(productId: searchCtrl.searchListDisplay[index].id)));
        },
        child: ItemCard(
          imagepath: searchCtrl.searchListDisplay[index]['image'][0],
          discount: searchCtrl.searchListDisplay[index]['discount'],
          price: searchCtrl.searchListDisplay[index]['price'],
          category: searchCtrl.searchListDisplay[index]['category'],
          name: searchCtrl.searchListDisplay[index]['name'],
          productId: searchCtrl.searchListDisplay[index].id,
        ),
      ),
      itemCount: searchCtrl.searchListDisplay.length,
    );
  }
}
