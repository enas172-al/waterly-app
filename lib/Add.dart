import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waterly/sliderwater.dart';


class Add extends StatelessWidget {

  const Add({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'كم كمية الماء التي شربتها؟',
      ),
      backgroundColor: const Color(0xffe1f6ff),
      content: const Sliderwater(),
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
            style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
          ),
        )
      ],
    );
  }
}