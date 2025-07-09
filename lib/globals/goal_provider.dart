import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoalProvider extends ChangeNotifier {
  int _goalMl = 2000;
  int get goalMl => _goalMl;

  GoalProvider() {
    _loadGoal();
  }

  Future<void> _loadGoal() async {
    final prefs = await SharedPreferences.getInstance();
    final storedGoal = prefs.getInt('daily_goal_ml');
    if (storedGoal != null) {
      _goalMl = storedGoal;
      notifyListeners();
    }
  }

  Future<void> setGoal(int newGoal) async {
    _goalMl = newGoal;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('daily_goal_ml', newGoal);
  }
}
