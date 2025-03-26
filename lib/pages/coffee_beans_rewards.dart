import 'package:coffee_shop_app/models/reward_Item_list.dart';
import 'package:coffee_shop_app/provider/reward_provider.dart';
import 'package:coffee_shop_app/widgets/reward_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeeBeansRewards extends StatelessWidget {
  CoffeeBeansRewards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 111, 78, 55),
      body: Consumer<RewardProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "Earn & Burn Beans",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 221, 184, 146),
                      fontFamily: "CooperBlack",
                      fontSize: 20),
                ),
                SizedBox(height: 20),
                // Points Balance Section
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 184, 139, 109),
                  ),
                  margin: EdgeInsets.all(16.0),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Beans Rewards Balance",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "lib/images/coffee-beans.png",
                                height: 28,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "${provider.points}",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Redeemable Items Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(),
                      SizedBox(height: 16),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 3 / 4,
                        ),
                        itemCount: rewards.length,
                        itemBuilder: (context, index) {
                          final item = rewards[index];
                          return RewardCard(
                            title: item.title,
                            cost: item.cost,
                            image: item.image,
                            onRedeem: () {
                              if (provider.points >= item.cost) {
                                provider.redeemPoints(item.cost);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Redeemed ${item.title}!"),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Insufficient points."),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
