import 'package:flutter/material.dart';
import 'package:waterly/setdailyterget.dart';


import '../Setreminders.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int goalMl = 2000; //  القيمة المبدئية للهدف اليومي (قابلة للتعديل من الديالوج)
  String reminderTime = 'كل ساعتين'; //  القيمة المبدئية لوقت التذكير

  //  فتح نافذة تحديد الهدف اليومي
  void _openTargetDialog() async {
    final result = await showDialog(
      context: context,
      builder: (context) => const SetDailyTarget(),
    );

    if (result != null && result is int) {
      setState(() {
        goalMl = result;
      });
    }
  }

  ///  فتح نافذة ضبط التذكير
  void _openRemindersDialog() async {
    final result = await showDialog(
      context: context,
      builder: (context) => const SetReminders(),
    );

    if (result != null && result is String) {
      setState(() {
        reminderTime = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ///  كرت تحديد الهدف اليومي
        GestureDetector(
          onTap: _openTargetDialog,
          child: SizedBox(
            width: double.infinity,
            child: Material(
              color: Theme.of(context).colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.track_changes, color: Color(0xfff9d91d)),
                        const SizedBox(width: 8),
                        Text(
                          'الهدف اليومي',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                    Text(
                      '$goalMl ml',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 13),

        ///  كرت التذكيرات
        GestureDetector(
          onTap: _openRemindersDialog,
          child: SizedBox(
            width: double.infinity,
            child: Material(
              color: Theme.of(context).colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.notifications_rounded, color: Color(0xfff9d91d)),
                        const SizedBox(width: 8),
                        Text(
                          'تنبيهات',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                    Text(
                      reminderTime,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 13),

        ///  خط فاصل للتصميم
        SizedBox(
          width: double.infinity,
          height: 9,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            child: Container(
              decoration: const BoxDecoration(color: Color(0xffbebcbc)),
            ),
          ),
        ),
      ],
    );
  }
}
