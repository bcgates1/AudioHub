import 'package:audiohub/controllers/wishlist/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeletedItemCard extends StatelessWidget {
  const DeletedItemCard({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Consumer<WishListController>(
        builder: (context, value, child) => Stack(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'product deleted by admin',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                onPressed: () async {
                  await value.deleteWishList(productId: productId, context: context);
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.black,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
