import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  List<String>? imagesLinks;

  CarouselItem({this.imagesLinks});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imagesLinks!
          .map(
            (e) => Image(
              image: NetworkImage(e),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          )
          .toList(),
      options: CarouselOptions(
        height: 250.0,
        initialPage: 0,
        enableInfiniteScroll: false,
        viewportFraction: 1.0,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
