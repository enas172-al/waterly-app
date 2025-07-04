import 'package:flutter/material.dart';

class Setreminders extends StatelessWidget {
  const Setreminders({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'ضبط التّنبيهات',
        style: Theme.of(context).textTheme.labelLarge,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll<Color?>(
                Theme.of(context).colorScheme.onPrimary),
            foregroundColor: const WidgetStatePropertyAll<Color?>(null),
            shadowColor: WidgetStatePropertyAll<Color?>(
                Theme.of(context).colorScheme.onSecondary),
            elevation: const WidgetStatePropertyAll<double?>(2),
            side: const WidgetStatePropertyAll<BorderSide?>(null),
            shape: const WidgetStatePropertyAll<RoundedRectangleBorder?>(null),
          ),
          child: Text(
            'تأكيد',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        )
      ],
      backgroundColor: const Color(0xffe1f6ff),
      content: DropdownButtonFormField<String>(
        items: [
          const DropdownMenuItem<String>(
            value: 'first',
            child: Text(
              'first',
            ),
          )
        ],
        value: 'first',
        onChanged: (value) {},
        decoration: InputDecoration(
          fillColor: Theme.of(context).colorScheme.onPrimary,
          filled: true,
          prefixIcon: const Icon(
            Icons.notifications_rounded,
            color: Color(0xfff4c73d),
          ),
        ),
        borderRadius: BorderRadius.circular(18),
      ),
    );
  }
}