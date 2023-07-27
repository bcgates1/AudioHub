import 'package:audiohub/views/core/style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://m.media-amazon.com/images/G/31/img22/WLA/Launches23/Mi/RedmiBuds4Active/Sale/D83995390_IN_WLA_Redmi_Buds4Active_Launch_978x900._SS900_QL85_.jpg',
  'https://m.media-amazon.com/images/G/31/camera/audio/sony/Sony._SS900_QL85_.jpg',
  'https://m.media-amazon.com/images/G/31/img22/WLA/Launches23/OnePlusNordBuds2/Sale/D75520316_IN_WLA_OnePlusNordBuds2_launch_978x900._SS900_QL85_.jpg',
];

class CarouselHome extends StatelessWidget {
  CarouselHome({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: true,
        autoPlay: true,
      ),
      items: imageSliders,
    );
  }

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            decoration: const BoxDecoration(
                color: Colors.white, boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black)]),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Image.network(
              item,
              fit: BoxFit.cover,
              width: kwidth,
              height: kheight,
            ),
          ))
      .toList();
}
