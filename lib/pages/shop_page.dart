import 'package:coffee_shop_app/components/coffee_tile.dart';
import 'package:coffee_shop_app/models/coffee.dart';
import 'package:coffee_shop_app/models/coffee_shop.dart';
import 'package:coffee_shop_app/widgets/carousel_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add coffee to cart
  void addToCart(Coffee coffee) {
    HapticFeedback.mediumImpact();
    // add to cart
    Provider.of<CoffeeShop>(context, listen: false).addItemCart(coffee);

    // let user know it add been successfully added
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        backgroundColor: Colors.brown,
        title: Text(
          "Successfully added to Cart",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CarouselSliderWithAutoSwipe(),
              const SizedBox(height: 20),
              const Text(
                "How would you like your coffee?",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "CooperBlack", 
                  
                ),
              ),
              const SizedBox(height: 25),

              // list of coffee to buy
              Expanded(
                child: ListView.builder(
                  itemCount: value.coffeeShop.length,
                  itemBuilder: (context, index) {
                    // get individual coffee
                    Coffee eachCofee = value.coffeeShop[index];

                    // return the tile for this coffee
                    return CoffeeTile(
                      coffee: eachCofee,
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () => addToCart(eachCofee),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
