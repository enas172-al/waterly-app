import 'package:flutter/material.dart';

class SetDailyTarget extends StatefulWidget {
  const SetDailyTarget({super.key});

  @override
  State<SetDailyTarget> createState() => _SetDailyTargetState();
}

class _SetDailyTargetState extends State<SetDailyTarget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'حدد الهدف اليومي',
        style: Theme.of(context).textTheme.labelLarge,
        textAlign: TextAlign.start,
      ),
      content: TextFormField(
        controller: _controller,
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
        keyboardType: TextInputType.number,
      ),
      backgroundColor: const Color(0xffe1f6ff),
      actions: [
        ElevatedButton(
          onPressed: () {
            final input = _controller.text.trim();
            final int? value = int.tryParse(input);

            if (value != null && value > 0) {
              Navigator.pop(context, value); // ترجع القيمة للصفحة اللي فتحت الديالوج
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("أدخل قيمة صحيحة")),
              );
            }
          },
          child: Text(
            'تأكيد',
            style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
          ),
        )
      ],
    );
  }
}
