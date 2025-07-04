import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ بيانات وهمية مؤقتة -  تبدلها بقيم من SharedPreferences
    final List<Map<String, dynamic>> weeklyData = [
      {"day": "الأحد", "date": "30 يونيو", "amount": 1800},
      {"day": "الاثنين", "date": "1 يوليو", "amount": 2000},
      {"day": "الثلاثاء", "date": "2 يوليو", "amount": 850},
      {"day": "الأربعاء", "date": "3 يوليو", "amount": 1200},
    ];

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
  }
}
