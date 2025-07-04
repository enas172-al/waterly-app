import 'package:flutter/material.dart';
import 'package:waterly/sliderwater.dart';

class Add extends StatelessWidget {
  const Add({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      backgroundColor: Color(0xffcbe9f6),
      content: Sliderwater(), // الزر موجود داخل Sliderwater الآن
    );
  }
}
