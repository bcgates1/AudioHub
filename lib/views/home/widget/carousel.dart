import 'package:audiohub/service/firebase/fetchdata.dart';
import 'package:audiohub/views/core/style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselHome extends StatelessWidget {
  const CarouselHome({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FetchDataFirebase.bannerImages.snapshots(),
        builder: (context, snapshot) {
          return CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: true,
              autoPlay: true,
            ),
            items: snapshot.connectionState == ConnectionState.waiting
                ? [
                    const Center(
                      child: CircularProgressIndicator(),
                    )
                  ]
                : snapshot.data!.docs
                    .map((item) => Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black)],
                          ),
                          margin: EdgeInsets.symmetric(vertical: kwidth * 0.02),
                          child: Image.network(
                            item['image'],
                            fit: BoxFit.fitWidth,
                            width: kwidth,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                // Image is fully loaded.
                                return child;
                              } else {
                                // Show a loading indicator while the image is loading.
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              }
                            },
                          ),
                        ))
                    .toList(),
          );
        });
  }
}
