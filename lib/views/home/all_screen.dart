import 'package:audiohub/service/firebase/fetchdata.dart';
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
          StreamBuilder(
            stream: FetchDataFirebase.allProducts.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text('No products found'),
                );
              }
              return GridView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: kheight * 0.32,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(
                          productId: snapshot.data!.docs[index].id,
                        ),
                      ),
                    );
                  },
                  child: ItemCard(
                    imagepath: snapshot.data!.docs[index]['image'],
                    discount: snapshot.data!.docs[index]['discount'],
                    price: snapshot.data!.docs[index]['price'],
                    name: snapshot.data!.docs[index]['name'],
                    category: snapshot.data!.docs[index]['category'],
                    productId: snapshot.data!.docs[index].id,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
