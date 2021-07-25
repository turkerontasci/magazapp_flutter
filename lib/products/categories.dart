
import 'package:magazapp_flutter/category_pages/accessories.dart';
import 'package:magazapp_flutter/category_pages/electronics.dart';
import 'package:magazapp_flutter/category_pages/home_design.dart';
import 'package:magazapp_flutter/category_pages/mens_wear.dart';
import 'package:magazapp_flutter/category_pages/personal_care.dart';
import 'package:magazapp_flutter/category_pages/womens_wear.dart';

List categories = [
  {
    "id": 1,
    "title": "Kadın Giyim",
    "image": "images/category_images/elbise.jpeg",
    "category_route": WomensWear(),
  },
  {
    "id": 2,
    "title": "Erkek Giyim",
    "image": "images/category_images/erkekgiyim.jpeg",
    "category_route": MensWear(),
  },
  {
    "id": 3,
    "title": "Aksesuar",
    "image": "images/category_images/canta.jpeg",
    "category_route": Accessories(),
  },
  {
    "id": 4,
    "title": "Elektronik",
    "image": "images/category_images/wdblack.jpeg",
    "category_route": Electronics(),
  },
  {
    "id": 5,
    "title": "Ev - Yaşam",
    "image": "images/category_images/mobilya.jpeg",
    "category_route": HomeDesign(),
  },
  {
    "id": 6,
    "title": "Kişisel Bakım",
    "image": "images/category_images/kisiselbakim.jpeg",
    "category_route": PersonalCare(),
  },
  {
    "id": 7,
    "title": "Hobi Müzik",
    "image": "images/category_images/guitar.jpeg",
  },
  {
    "id": 8,
    "title": "Spor",
    "image": "images/category_images/nike.jpeg",
  },
  {
    "id": 9,
    "title": "Outdoor",
    "image": "images/category_images/outdoor2.jpeg",
  },
  {
    "id": 10,
    "title": "Kitap",
    "image": "images/category_images/kitap.jpeg",
  },
  {
    "id": 11,
    "title": "Kırtasiye",
    "image": "images/category_images/kalem.jpeg",
  },
  {
    "id": 12,
    "title": "Pet Shop",
    "image": "images/category_images/kedigopek.jpeg",
  },
];