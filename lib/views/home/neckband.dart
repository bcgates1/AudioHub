import 'package:audiohub/service/firebase/fetchdata.dart';
import 'package:audiohub/views/common_widgets/item_card.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:flutter/material.dart';

class NeckbandScreen extends StatelessWidget {
  const NeckbandScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FetchDataFirebase.neckband.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text('No products found'),
          );
        }
        return GridView.builder(
          itemCount: snapshot.data!.docs.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: kheight * 0.32,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          padding: const EdgeInsets.all(5),
          itemBuilder: (context, index) {
            final data = snapshot.data!.docs[index].data();
            return InkWell(
              onTap: () {
                // Navigator.of(context).pushNamed(ProductDetails.routename);
              },
              child: ItemCard(
                imagepath: data['image'],
                discount: data['discount'],
                price: data['price'],
                category: data['category'],
                name: data['name'],
                productId: snapshot.data!.docs[index].id,
              ),
            );
          },
        );
      },
    );
  }
}
