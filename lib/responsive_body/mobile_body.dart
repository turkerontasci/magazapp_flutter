import 'package:flutter/material.dart';

import '../screens/category_screen.dart';
import '../screens/home_screen.dart';
import '../screens/product_page.dart';
import '../screens/profile_screen.dart';
import '../screens/shopping_cart_screen.dart';
import 'package:badges/badges.dart' as badges;

class MobileBody extends StatefulWidget {
  const MobileBody({super.key});

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    HomeScreen(),
    CategoryScreen(),
    ShoppingCartScreen(),
    ProfileScreen()
  ];

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
