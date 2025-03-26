import 'package:coffee_shop_app/components/coffee_tile.dart';
import 'package:coffee_shop_app/models/coffee.dart';
import 'package:coffee_shop_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // remove  item from cart
  void removeFromCart(Coffee coffee) {
    HapticFeedback.mediumImpact();
    Provider.of<CoffeeShop>(context, listen: false).removeItemCart(coffee);
  }

  // pay button tapped
  void payNow() {
    HapticFeedback.mediumImpact();

    /*
    fill out your paymet service here
    */
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // heading
              const Text(
                "Your Cart",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "CooperBlack",
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 20),

              // list of cart items
              Expanded(
                child: ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index) {
                    // get individual cart items
                    Coffee eachCofee = value.userCart[index];

                    // returen coffee tile
                    return CoffeeTile(
                      coffee: eachCofee,
                      onPressed: () => removeFromCart(eachCofee),
                      icon: const Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 191, 6, 3),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 69, 33, 3),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  payNow();
                },
                child: const Center(
                  child: Text(
                    "Pay Now",
                    style: TextStyle(
                      fontFamily: "CooperBlack",
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
