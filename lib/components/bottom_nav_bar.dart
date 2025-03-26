import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return GNav(
      haptic: true,
      onTabChange: (value) => onTabChange!(value),
      color: Colors.white,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      activeColor: Colors.white,
      tabBackgroundColor: Color.fromARGB(255, 221, 184, 146),
      tabBorderRadius: 24,
      textStyle: TextStyle(color: Colors.white),
      tabActiveBorder: Border.all(
        color: Color.fromARGB(255, 221, 184, 146),
      ),
      tabs: const [
        // Shop
        GButton(
          icon: Icons.home,
          text: "Shop",
        ),
    
        // Beans Rewards
        GButton(
          icon: Icons.redeem_outlined,
          text: "Beans Rewards",
        ),
    
        // Cart
        GButton(
          icon: Icons.shopping_bag_outlined,
          text: "Cart",
        ),
      ],
    );
  }
}
