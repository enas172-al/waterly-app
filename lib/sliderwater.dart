import 'package:flutter/material.dart';



class Sliderwater extends StatelessWidget {

  const Sliderwater({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: null,
          height: null,
          child: Text(
            '50 ml ',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
          ),
        ),
        SizedBox(
          width: 350,
          height: 40,
          child: Slider(
            value: 0.5,
            onChanged: (value) {},
            activeColor: const Color(0xff25abe4),
          ),
        )
      ],
    );
  }
}
