import 'package:flutter/material.dart';

import '../screens/product_page.dart';

class RowOffersWidget extends StatelessWidget {
  const RowOffersWidget({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });

  final int id;
  final String title;
  final double price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductPage(
                id: id,
                title: title,
                price: price,
                image: image,
              ),
            ),
          );
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 120.0,
                width: 120.0,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "${price.toStringAsFixed(2)} TL",
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
