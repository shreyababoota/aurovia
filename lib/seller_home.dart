import 'package:flutter/material.dart';
import 'product_list.dart';
import 'help_desk.dart';
import 'homepage_seller.dart';

class SellerHome extends StatefulWidget {
  const SellerHome({super.key});

  @override
  State<SellerHome> createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome> {
  int selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    Center(child: SellerHomePage()),
    Center(child: ProductList()),
    Center(child: HelpDesk()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontFamily: 'Heading'),
        selectedIconTheme: IconThemeData(size: 30),
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color.fromRGBO(46, 83, 3, 1),
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'LeaderBoard',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Help'),
        ],
      ),
    );
  }
}
