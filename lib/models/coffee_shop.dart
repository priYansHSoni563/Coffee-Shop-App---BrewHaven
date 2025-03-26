import 'package:coffee_shop_app/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  // coffee for sale  list
  final List<Coffee> _shop = [
    // Hot Tea
    Coffee(
      name: "Hot Tea",
      price: "₹ 800/-",
      imagepath: "lib/images/hot-tea.png",
    ),
    // Coffee
    Coffee(
      name: "Coffee",
      price: "₹ 1100/-",
      imagepath: "lib/images/coffee.png",
    ),

    // latte Coffee
    Coffee(
      name: "Coffee Latte",
      price: "₹ 1490/-",
      imagepath: "lib/images/coffee-latte.png",
    ),

    // Expresso Coffee
    Coffee(
      name: "Espresso",
      price: "₹ 1712/-",
      imagepath: "lib/images/expresso.png",
    ),

    // iced Coffee
    Coffee(
      name: "Iced Coffee",
      price: "₹ 2367/-",
      imagepath: "lib/images/ice-coffee.png",
    ),

    // Cappuccino Coffee
    Coffee(
      name: "Cappuccino",
      price: "₹ 2669/-",
      imagepath: "lib/images/cappuccino.png",
    ),

    // ChocoLoom Cookie
    Coffee(
      name: "ChocoLoom Cookie",
      price: "₹ 2000/- (Pc 3)",
      imagepath: "lib/images/cookie.png",
    ),
    
    // ChocoLoom Cookie
    Coffee(
      name: "Cherry Bliss Layers Cake",
      price: "₹ 3467/- ",
      imagepath: "lib/images/Pastry.png",
    ),
  ];

  // user cart
  // ignore: prefer_final_fields
  List<Coffee> _userCart = [];

  //  get coffee list
  List<Coffee> get coffeeShop => _shop;

  // get user cart
  List<Coffee> get userCart => _userCart;

  // add item to cart
  void addItemCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  // remove item from cart
  void removeItemCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
