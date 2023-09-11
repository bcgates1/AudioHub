import 'package:audiohub/controllers/product_image/add_product_image.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPageview extends StatelessWidget {
  const ProductPageview({super.key, required this.imagePath});
  final List imagePath;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductImageProvider(),
      builder: (context, child) => Consumer<ProductImageProvider>(
        builder: (context, imgIndicator, child) => Column(
          children: [
            SizedBox(
              height: kheight * 0.5,
              width: double.infinity,
              child: PageView.builder(
                onPageChanged: (value) => imgIndicator.imageIndicator(value),
                itemCount: imagePath.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: double.infinity,
                    child: Image.network(
                      imagePath[index],
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: indicators(imagePath.length, imgIndicator.showImageindicator),
            )
          ],
        ),
      ),
    );
  }
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List.generate(
    imagesLength,
    (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle,
        ),
      );
    },
  );
}
