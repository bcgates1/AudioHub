import 'package:audiohub/views/core/style.dart';
import 'package:flutter/material.dart';

class ProductPageview extends StatelessWidget {
  const ProductPageview({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kheight * 0.5,
      width: double.infinity,
      child: PageView.builder(
        itemBuilder: (context, index) => SizedBox(
          width: double.infinity,
          child: Image.network(
            imagePath,
            fit: BoxFit.fitHeight,
          ),
        ),
        itemCount: 3,
      ),
    );
  }
}
