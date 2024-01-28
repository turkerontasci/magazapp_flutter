import 'package:flutter/material.dart';
import 'package:magazapp_flutter/category_pages/mens_wear.dart';
import 'package:magazapp_flutter/components/item_card_widget.dart';
import 'package:magazapp_flutter/components/offers_widget.dart';
import 'package:magazapp_flutter/components/row_categories_widget.dart';
import 'package:magazapp_flutter/components/row_offers_widget.dart';
import 'package:magazapp_flutter/screens/category_screen.dart';
import '../components/custom_appbar.dart';
import '../products/category_product.dart';
import '../products/product.dart';

class TabletBody extends StatefulWidget {
  const TabletBody({super.key});

  @override
  State<TabletBody> createState() => _TabletBodyState();
}

class _TabletBodyState extends State<TabletBody> {
  @override
  Widget build(BuildContext context) {
    var newList = products + womens_wear_list + mens_wear_list;

    (newList..shuffle()).first;
    (productsRow..shuffle()).first;
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            OffersWidget(
              height: 400,
              fraction: 1,
              id: lastList[0]["id"],
              title: lastList[0]["title"],
              price: lastList[0]["price"],
              imageAsset: lastList[0]["image"],
            ),
            HeaderWidget(
              title: "Kategoriler",
              route: CategoryScreen(),
            ),
            RowCategoriesWidget(
              height: 75,
              width: 125,
            ),
            HeaderWidget(
              title: "Fırsatlar",
              route: MensWear(),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  products.length,
                  (index) => RowOffersWidget(
                    id: products[index]["id"],
                    title: products[index]["title"],
                    price: products[index]["price"],
                    image: products[index]["image"],
                  ),
                ),
              ),
            ),
            HeaderWidget(
              title: "Bugüne Özel",
              route: CategoryScreen(),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(10.0),
              childAspectRatio: 9.0 / 10.0,
              crossAxisCount: 4,
              children: List.generate(
                newList.length,
                (index) => ItemCardWidget(
                  id: newList[index]["id"],
                  title: newList[index]["title"],
                  price: newList[index]["price"],
                  image: newList[index]["image"],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.title,
    required this.route,
  });

  final String title;
  final Widget route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => route));
            },
            child: Text(
              "Tümünü Gör >",
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
