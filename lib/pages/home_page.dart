import 'package:coffee_shop_app/components/bottom_nav_bar.dart';
import 'package:coffee_shop_app/pages/coffee_beans_rewards.dart';
import 'package:coffee_shop_app/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // navigate bottom bar
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages
  final List<Widget> _pages = [
    // shop page
    const ShopPage(),

    CoffeeBeansRewards(),

    // cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 111, 78, 55),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 111, 78, 55),
        title: Row(
          children: [
            Image.asset(
              'lib/images/Coffee icon.png', // Path to your logo asset
              height: 50, // Adjust as needed
            ),

            // Space between logo and text
            const SizedBox(width: 8),
            Text(
              'BrewHaven',
              style: TextStyle(
                color: const Color.fromARGB(255, 221, 184, 146),
                fontFamily: "CooperBlack",
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
