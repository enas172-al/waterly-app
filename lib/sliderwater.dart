import 'package:flutter/material.dart';

class Sliderwater extends StatefulWidget {
  const Sliderwater({super.key});

  @override
  State<Sliderwater> createState() => _SliderwaterState();
}

class _SliderwaterState extends State<Sliderwater> {
  double selectedValue = 50;
  double min = 50;
  double max = 1000;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${selectedValue.toInt()} ml',
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),
        Slider(
          min: min,
          max: max,
          divisions: ((max - min) ~/ 50),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
          activeColor: const Color(0xff25abe4),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(selectedValue.toInt());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 4, // هذا الظل
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          child: const Text(
            'تأكيد' ,
          style: TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),

        ),
            ),

  ],
    );
  }
}
