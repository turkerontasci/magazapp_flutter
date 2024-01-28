import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../products/product.dart';
import '../screens/product_page.dart';

class OffersWidget extends StatelessWidget {
  const OffersWidget({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.imageAsset,
    required this.height,
    required this.fraction,
  });

  final int id;
  final String title;
  final double price;
  final String imageAsset;
  final double height;
  final double fraction;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        aspectRatio: 18 / 9,
        viewportFraction: fraction, //sıkılırsan 0.95 yap...
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: false,
        scrollDirection: Axis.horizontal,
      ),
      items: List.generate(
        lastList.length,
        (index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductPage(
                  id: id,
                  title: title,
                  price: price,
                  image: imageAsset,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(lastList[index]["image"]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
