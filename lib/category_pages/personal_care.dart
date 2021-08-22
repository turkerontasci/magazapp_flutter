import 'package:flutter/material.dart';
import 'package:magazapp_flutter/products/categories.dart';
import 'package:magazapp_flutter/products/category_product.dart';
import 'package:magazapp_flutter/screens/product_page.dart';

class PersonalCare extends StatefulWidget {
  final int id;
  final String title;
  final String image;
  final double price;
  final int qty;

  PersonalCare({this.id, this.title, this.image, this.price, this.qty});

  @override
  _PersonalCareState createState() => _PersonalCareState();
}

class _PersonalCareState extends State<PersonalCare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
            "${categories[5]["title"]}"
        ),
        toolbarHeight: 45.0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(10.0),
            childAspectRatio: 9.0 / 10.0,
            crossAxisCount: 2,
            children: List.generate(
              womens_wear_list.length,
                  (index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductPage(
                        id: womens_wear_list[index]["id"],
                        title: womens_wear_list[index]["title"],
                        price: womens_wear_list[index]["price"],
                        image: womens_wear_list[index]["image"],
                        specs: womens_wear_list[index]["specs"],
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 18.0 / 13.0,
                        child: Image.asset(
                          womens_wear_list[index]["image"],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${womens_wear_list[index]["title"]}",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "${womens_wear_list[index]["price"].toStringAsFixed(2)} TL",
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
