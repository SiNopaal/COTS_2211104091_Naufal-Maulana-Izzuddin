import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final _pages = [
    Center(child: Text("Home")),
    Center(child: Text("Promo")),
    Center(child: Text("Pesanan")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: "Promo"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Pesanan"),
        ],
      ),
      body: _pages[_currentIndex],
    );
  }
}
