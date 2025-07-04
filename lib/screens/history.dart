import 'package:flutter/material.dart';

import '../dailyprogress.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      itemBuilder: (context, index) => const Dailyprogress(),
      separatorBuilder: (context, index) => const SizedBox(height: 14),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    );
  }
}


