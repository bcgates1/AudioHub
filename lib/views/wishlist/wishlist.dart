import 'package:audiohub/controllers/wishlist/wishlist_controller.dart';
import 'package:audiohub/service/firebase/fetchdata.dart';
import 'package:audiohub/views/common_widgets/appbar.dart';
import 'package:audiohub/views/common_widgets/item_card.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:audiohub/views/product/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarCom(title: 'Wishlist'),
        body: Consumer<WishListController>(
          builder: (context, value, child) => Padding(
            padding: const EdgeInsets.all(5.0),
            child: GridView.builder(
              itemCount: value.wishList.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: kheight * 0.32,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              // padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
              itemBuilder: (context, index) => FutureBuilder(
                future: FetchDataFirebase.fetchProductWithId(productId: value.wishList[index]),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductDetails(
                              productId: value.wishList[index],
                            ),
                          ),
                        );
                      },
                      child: ItemCard(
                        imagepath: snapshot.data!['image'],
                        discount: snapshot.data!['discount'],
                        price: snapshot.data!['price'],
                        category: snapshot.data!['category'],
                        name: snapshot.data!['name'],
                        productId: value.wishList[index],
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
