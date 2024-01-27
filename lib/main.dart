import 'package:flutter/material.dart';
import 'package:magazapp_flutter/screens/category_screen.dart';
import 'package:magazapp_flutter/screens/home_screen.dart';
import 'package:magazapp_flutter/screens/product_page.dart';
import 'package:magazapp_flutter/screens/shopping_cart_screen.dart';
import 'package:magazapp_flutter/screens/profile_screen.dart';
import 'package:badges/badges.dart' as badges;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magazapp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        backgroundColor: Colors.white,
      ),
      home: MainPage(
        title: 'Magazapp',
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({super.key, required this.title});

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    HomeScreen(),
    CategoryScreen(),
    ShoppingCartScreen(),
    ProfileScreen()
  ];

  int _cartBadgeAmount = cartList.length;

  late bool _showCartBadge;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool _checkList() {
    if (cartList.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        toolbarHeight: 45.0,
        centerTitle: true,
        title: Text(
          "Magazapp",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 24.0,
            color: Colors.white,
          ),
        ),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey.shade400,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Anasayfa',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Kategoriler',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: badges.Badge(
              badgeAnimation: badges.BadgeAnimation.slide(
                disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
                curve: Curves.easeInCubic,
              ),
              position: badges.BadgePosition.bottomEnd(
                bottom: 6,
                end: -6,
              ),
              showBadge: _checkList(),
              badgeStyle: badges.BadgeStyle(
                badgeColor: Colors.pink,
              ),
              badgeContent: Text(
                "${(cartList.length).toString()}",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: Icon(Icons.shopping_cart),
            ),
            label: 'Sepet',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
              backgroundColor: Colors.white),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        onTap: _onItemTapped,
      ),
    );
  }
}
