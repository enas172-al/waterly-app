import 'package:flutter/material.dart';
import 'package:waterly/setdailyterget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../globals/goal_provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int goalMl = 2000; // القيمة المبدئية للهدف اليومي
  String reminderTime = 'كل ساعتين'; // القيمة المبدئية للتذكير
  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final storedGoal = prefs.getInt('daily_goal_ml');
    final storedReminder = prefs.getString('reminder_time');
    setState(() {
      if (storedGoal != null) goalMl = storedGoal;
      if (storedReminder != null) reminderTime = storedReminder;
    });
  }

  void _openRemindersDialog() async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => ReminderDialog(selected: reminderTime),
    );
    if (result != null) {
      setState(() {
        reminderTime = result;
      });
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('reminder_time', result);
    }
  }

  // Removed duplicate initState and _loadPrefs methods
  // The original initState and _loadPrefs methods are kept above.

  void _openTargetDialog() async {
    final result = await showDialog(
      context: context,
      builder: (context) => const SetDailyTarget(),
    );

    if (result != null && result is int) {
      Provider.of<GoalProvider>(context, listen: false).setGoal(result);
      setState(() {
        goalMl = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final goalProvider = Provider.of<GoalProvider>(context);
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
                      '${goalProvider.goalMl} ml',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 13),

        ///  كرت التذكير (بدون إشعارات)
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
                        const Icon(Icons.alarm, color: Color(0xfff9d91d)),
                        const SizedBox(width: 8),
                        Text(
                          'تذكير',
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

/// Dialog for selecting reminder interval (no notifications, just saves value)
class ReminderDialog extends StatelessWidget {
  final String selected;
  const ReminderDialog({required this.selected, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final options = [
      'كل ساعة',
      'كل ساعتين',
      'كل 3 ساعات',
      'كل 4 ساعات',
      'لا أريد تذكير',
    ];
    return AlertDialog(
      title: const Text('اختر فترة التذكير'),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: options.length,
          itemBuilder: (context, i) => RadioListTile<String>(
            value: options[i],
            groupValue: selected,
            title: Text(options[i]),
            onChanged: (val) => Navigator.of(context).pop(val),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(selected),
          child: const Text('إلغاء'),
        ),
      ],
    );
  }
}
  

