import 'package:flutter/material.dart';

class Product {
  final String image, title;
  final double price;
  final int id;

  Product({
    this.id,
    this.title,
    this.price,
    this.image,
  });

  List<Product> _product = [
    Product(
      id: 1,
      title: "Sırt Çantası",
      price: 300.0,
      image: "images/canta.jpeg",
    ),
    Product(
      id: 2,
      title: "Elbise",
      price: 100.0,
      image: "images/elbise.jpeg",
    ),
    Product(
        id: 3,
        title: "Güneş Gözlüğü",
        price: 500.0,
        image: "images/gozluk2.jpeg"),
    Product(
      id: 4,
      title: "Fender American Telecaster",
      price: 12000.0,
      image: "images/guitar.jpeg",
    ),
    Product(
      id: 5,
      title: "Boya Kalem Set",
      price: 35.0,
      image: "images/kalem.jpeg",
    ),
    Product(
      id: 6,
      title: "WD Black 3TB SSD",
      price: 4000.0,
      image: "images/wdblack.jpeg",
    ),
    Product(
      id: 7,
      title: "Nikon D800",
      price: 5000.0,
      image: "images/nikon.jpeg",
    ),
    Product(
      id: 8,
      title: "Bluetooth Kulaklık",
      price: 300.0,
      image: "images/kulaklık.jpeg",
    ),
    Product(
      id: 9,
      title: "Nike Ayakkabı",
      price: 300.0,
      image: "images/nike.jpeg",
    ),
  ];
}
