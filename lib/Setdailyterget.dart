import 'package:flutter/material.dart';



class Setdailyterget extends StatelessWidget {

  const Setdailyterget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'حدد الهدف اليومي ',
        style: Theme.of(context).textTheme.labelLarge,
        textAlign: TextAlign.start,
      ),
      content: TextFormField(
        decoration: InputDecoration(
          labelText: 'هدفك اليومي',
          labelStyle: Theme.of(context).textTheme.labelMedium,
          filled: true,
          fillColor: Theme.of(context).colorScheme.onPrimary,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0x00000000)),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Color(0xfff5c26f)),
              borderRadius: BorderRadius.circular(20)),
          prefixIcon: const Icon(
            Icons.track_changes_outlined,
            color: Color(0xfff4c73d),
          ),
        ),
        style: Theme.of(context).textTheme.labelMedium,
      ),
      backgroundColor: const Color(0xffe1f6ff),
      actions: [
        ElevatedButton(
          onPressed: () {},
          onLongPress: null,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll<Color?>(
                Theme.of(context).colorScheme.onPrimary),
            foregroundColor: const WidgetStatePropertyAll<Color?>(null),
            shadowColor: const WidgetStatePropertyAll<Color?>(null),
            elevation: const WidgetStatePropertyAll<double?>(null),
            side: const WidgetStatePropertyAll<BorderSide?>(null),
            shape: const WidgetStatePropertyAll<RoundedRectangleBorder?>(null),
          ),
          child: Text(
            'تأكيد',
            style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
          ),
        )
      ],
      iconColor: const Color(0xffffffff),
    );
  }
}