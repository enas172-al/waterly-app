import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class History extends StatelessWidget {
  const History({super.key});

  static final ValueNotifier<int> historyNotifier = ValueNotifier<int>(0);
  static void notifyHistoryChanged() {
    historyNotifier.value++;
  }

  String _getDayName(DateTime date) {
    const days = ["الأحد", "الاثنين", "الثلاثاء", "الأربعاء", "الخميس", "الجمعة", "السبت"];
    return days[date.weekday % 7];
  }

  String _getArabicDate(DateTime date) {
    const months = ["يناير", "فبراير", "مارس", "أبريل", "مايو", "يونيو", "يوليو", "أغسطس", "سبتمبر", "أكتوبر", "نوفمبر", "ديسمبر"];
    return "${date.day} ${months[date.month - 1]}";
  }

  Future<List<Map<String, dynamic>>> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final historyString = prefs.getString('water_history');
    if (historyString == null) return [];
    final Map<String, dynamic> history = jsonDecode(historyString);
    final entries = history.entries.toList()
      ..sort((a, b) => b.key.compareTo(a.key));
    return entries.map((e) {
      final dateParts = e.key.split('-');
      final date = DateTime(
        int.parse(dateParts[0]),
        int.parse(dateParts[1]),
        int.parse(dateParts[2]),
      );
      return {
        "day": _getDayName(date),
        "date": _getArabicDate(date),
        "amount": e.value,
      };
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: historyNotifier,
      builder: (context, _, __) {
        return FutureBuilder<List<Map<String, dynamic>>>(
          future: _loadHistory(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            final weeklyData = snapshot.data ?? [];
            if (weeklyData.isEmpty) {
              return const Center(child: Text('لا يوجد بيانات محفوظة'));
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: weeklyData.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final dayData = weeklyData[index];
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 🗓 اليوم والتاريخ
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dayData['day'],
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            dayData['date'],
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                      // 💧 كمية الاستهلاك
                      Row(
                        children: [
                          const Icon(Icons.water_drop, color: Colors.blueAccent),
                          const SizedBox(width: 6),
                          Text(
                            "${dayData['amount']} ml",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
