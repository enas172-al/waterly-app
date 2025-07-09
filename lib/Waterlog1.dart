import 'package:flutter/material.dart';

class Waterlog1 extends StatelessWidget {
  final int amount;
  final String time;
  final VoidCallback? onDelete;

  const Waterlog1({
    Key? key,
    required this.amount,
    required this.time,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.onPrimary,
      borderOnForeground: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 10,
          right: 10,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.water_drop,
                  color: Color(0xff25abe4),
                  size: 26,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$amount ml',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      _formatTime(time),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              icon: const Icon(
                Icons.delete_outlined,
                color: Color(0x51000000),
                size: 20,
              ),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(String timeString) {
    try {
      final dt = DateTime.parse(timeString);
      final hour = dt.hour.toString().padLeft(2, '0');
      final min = dt.minute.toString().padLeft(2, '0');
      return '$hour:$min';
    } catch (_) {
      return timeString;
    }
  }
}
