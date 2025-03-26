import 'package:coffee_shop_app/models/reward_Item.dart';

final List<RewardItem> _rewardItem = [
  //
  RewardItem(
    "Hot Tea @ Rs.1",
    800,
    "lib/images/hot-tea.png",
  ),

  //
  RewardItem(
    "Coffee @ Rs.1",
    1100,
    "lib/images/coffee.png",
  ),

  //
  RewardItem(
    "Coffee Latte @ Rs.1",
    1490,
    "lib/images/coffee-latte.png",
  ),

  //
  RewardItem(
    "Cappuccino @ Rs.1",
    2669,
    "lib/images/cappuccino.png",
  ),

  //
  RewardItem(
    "Iced Coffee @ Rs.1",
    2367,
    "lib/images/ice-coffee.png",
  ),

  //
  RewardItem(
    "Expresso @ Rs.1",
    1712,
    "lib/images/expresso.png",
  ),

  //
  RewardItem(
    "ChocoLoom Cookie @ Rs.1",
    2000,
    "lib/images/cookie.png",
  ),

  //
  RewardItem(
    "Cherry Bliss Layers Cake@ Rs.1",
    3467,
    "lib/images/Pastry.png",
  ),
];
List<RewardItem> get rewards => _rewardItem;
