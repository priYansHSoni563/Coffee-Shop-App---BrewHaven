import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RewardProvider extends ChangeNotifier {
  int points = 10000;

  void redeemPoints(int cost) {
    HapticFeedback.mediumImpact();
    if (points >= cost) {
      points -= cost;
      notifyListeners();
    } else {
      // Insufficient points
    }
  }

  void addPoints(int value) {
    points += value;
    notifyListeners();
  }
}
