import 'package:flutter/material.dart';

class SetReminders extends StatefulWidget {
  const SetReminders({super.key});

  @override
  State<SetReminders> createState() => _SetRemindersState();
}

class _SetRemindersState extends State<SetReminders> {
  String selectedInterval = 'كل ساعتين';

  final List<String> reminderOptions = [
    'كل ساعة',
    'كل ساعتين',
    'كل 3 ساعات',
    'كل 4 ساعات',
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'ضبط التّنبيهات',
        style: Theme.of(context).textTheme.labelLarge,
      ),
      backgroundColor: const Color(0xffe1f6ff),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<String>(
            value: selectedInterval,
            items: reminderOptions
                .map(
                  (option) => DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              ),
            )
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedInterval = value!;
              });
            },
            decoration: InputDecoration(
              fillColor: Theme.of(context).colorScheme.onPrimary,
              filled: true,
              prefixIcon: const Icon(
                Icons.notifications_rounded,
                color: Color(0xfff4c73d),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          const SizedBox(height: 10),
          Text(
            'اختر الوقت الذي تحب أن يصلك فيه تذكير بشرب الماء.',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, selectedInterval);
          },
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll<Color?>(
              Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          child: Text(
            'تأكيد',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ],
    );
  }
}
