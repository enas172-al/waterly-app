import 'package:flutter/material.dart';
import 'package:waterly/container1.dart';
import 'package:waterly/addwater.dart';
import 'package:arc_progress_bar_new/arc_progress_bar_new.dart';
import '../Add.dart';
import '../empty.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../globals/goal_provider.dart';
import 'dart:convert';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  // إضافة سجل الماء في SharedPreferences
  Future<void> _saveLog(int amount) async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    final todayKey = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    final logsString = prefs.getString('water_logs');
    Map<String, dynamic> logsMap = logsString != null ? jsonDecode(logsString) : {};
    List todayList = logsMap[todayKey] ?? [];
    todayList.add({'amount': amount, 'time': now.toIso8601String()});
    logsMap[todayKey] = todayList;
    await prefs.setString('water_logs', jsonEncode(logsMap));
  }
  int currentMl = 0;

  @override
  void initState() {
    super.initState();
    _loadCurrentMl();
  }

  Future<void> _loadCurrentMl() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now();
    final dateKey = "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";
    final historyString = prefs.getString('water_history');
    if (historyString != null) {
      final Map<String, dynamic> history = jsonDecode(historyString);
      if (history[dateKey] != null) {
        setState(() {
          currentMl = history[dateKey];
        });
      }
    }
  }

  void addWater(int amount) async {
    final goalMl = Provider.of<GoalProvider>(context, listen: false).goalMl;
    setState(() {
      currentMl += amount;
      if (currentMl > goalMl) currentMl = goalMl;
    });
    await _saveDailyWater(amount);
    await _saveLog(amount); // حفظ السجل اليومي
  }

  Future<void> _saveDailyWater(int addedAmount) async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now();
    final key = 'water_history';
    Map<String, dynamic> history = {};
    final historyString = prefs.getString(key);
    if (historyString != null) {
      history = jsonDecode(historyString);
    }
    final dateKey = "${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}";
    int previous = 0;
    if (history[dateKey] != null) {
      previous = history[dateKey];
    }
    history[dateKey] = previous + addedAmount;
    await prefs.setString(key, jsonEncode(history));
    // تحديث السجل تلقائياً
   // History.notifyHistoryChanged();
  }

  @override
  Widget build(BuildContext context) {
    final goalMl = Provider.of<GoalProvider>(context).goalMl;
    return SingleChildScrollView(
      child: Column(
        children: [
          // القوس العلوي والعداد
          SizedBox(
            width: double.infinity,
            height: 273,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 270,
                  height: 235,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 123.25,
                        left: 0,
                        child: Icon(
                          Icons.heart_broken_rounded,
                          color: Color(0xffbebebe),
                          size: 35,
                        ),
                      ),
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 15),
                          child: ArcProgressBar(
                            percentage: currentMl / goalMl * 100,
                            arcThickness: 7,
                            innerPadding: 3,
                            animateFromLastPercent: true,
                            handleSize: 0,
                            backgroundColor: const Color(0xffc1c1c1),
                            foregroundColor: const Color(0xff25abe4),
                          ),
                        ),
                      ),
                      Positioned(top: 17.5, left: 35, width: 200, height: 200, child: Container1()),
                      Positioned(
                        top: 131.25,
                        left: 66,
                        child: Text(
                          'هدف الشرب اليومي',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Positioned(
                        top: 104,
                        left: 66,
                        child: Text(
                          '$currentMl',
                          style: TextStyle(fontSize: 18, color: Color(0xff25abe4)),
                        ),
                      ),
                      Positioned(
                        top: 104,
                        left: 112,
                        child: Text('/ $goalMl ml', style: TextStyle(fontSize: 18)),
                      ),
                      Positioned(
                        top: 175,
                        left: 122.5,
                        child: Icon(Icons.local_drink_sharp, color: Color(0xff25abe4), size: 25),
                      ),
                      Positioned(
                        top: 123.25,
                        left: 235,
                        child: Icon(Icons.water_drop, color: Color(0xff25abe4), size: 35),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          // أزرار الإضافة
          _buildWaterRow(250, 'assets/images/sticker1.webp', 500, 'assets/images/stickerrrrr.webp'),
          _buildWaterRow(100, 'assets/images/stickerhhh.webp', 170, 'assets/images/sticker.webp'),

          // زر الإضافة وزر السجلات
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  color: const Color(0xfff4c73d),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                      side: BorderSide.none),
                  elevation: 3,
                  child: InkWell(
                    onTap: () async {
                      final result = await showDialog<int>(
                        context: context,
                        builder: (_) => const Add(),
                      );
                      if (result != null) {
                        addWater(result);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: const Icon(Icons.add_outlined, color: Color(0xff000000), size: 24),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const Empty()));
                  },
                  child: const Icon(Icons.list_alt_sharp, color: Color(0xff05188e), size: 35),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWaterRow(int amount1, String img1, int amount2, String img2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 137,
            child: GestureDetector(
              onTap: () => addWater(amount1),
              child: Addwater(param1: '$amount1 ml', param: img1),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 137,
            child: GestureDetector(
              onTap: () => addWater(amount2),
              child: Addwater(param1: '$amount2 ml', param: img2),
            ),
          ),
        ],
      ),
    );
  }
}
