import 'package:flutter/material.dart';

class Addwater extends StatelessWidget {
  const Addwater({
    this.param = 'assets/images/stickerrrrr.webp', // المسار المحلي
    this.param1 = '500 ml',
    super.key,
  });

  final String param;
  final String param1;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      color: const Color(0xff25abe4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 35,
              child: Image.asset(
                param,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              child: Text(
                param1,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
