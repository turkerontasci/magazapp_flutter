import 'package:flutter/material.dart';
import 'package:magazapp_flutter/components/reusable_card.dart';
import 'package:magazapp_flutter/products/categories.dart';
import 'package:magazapp_flutter/products/category_product.dart';
import 'package:magazapp_flutter/products/product.dart';
import 'package:magazapp_flutter/screens/product_page.dart';

class MensWear extends StatefulWidget {
  final int id;
  final String title;
  final String image;
  final double price;
  final int qty;

  MensWear({this.id, this.title, this.image, this.price, this.qty});

  @override
  _MensWearState createState() => _MensWearState();
}

class _MensWearState extends State<MensWear> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
            "${categories[1]["title"]}"
        ),
        toolbarHeight: 45.0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Row(
          children: [
            SizedBox(
              width: 60.0,
              child: Column(
                children: List.generate(
                  products.length,
                      (index) => ReusableCard(
                    color: Colors.grey.shade200,
                    cardHeigth: 50.0,
                    cardWidth: 50.0,
                    cardChild: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(products[index]["image"]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(10.0),
                childAspectRatio: 9.0 / 10.0,
                crossAxisCount: 2,
                children: List.generate(mens_wear_list.length, (index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductPage(
                          id: mens_wear_list[index]["id"],
                          title: mens_wear_list[index]["title"],
                          price: mens_wear_list[index]["price"],
                          image: mens_wear_list[index]["image"],
                          specs: mens_wear_list[index]["specs"],
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
                          child: Image.asset(mens_wear_list[index]["image"],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${mens_wear_list[index]["title"]}",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "${mens_wear_list[index]["price"].toStringAsFixed(2)} TL",
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
          ],
        ),
      ),
    );
  }
}
