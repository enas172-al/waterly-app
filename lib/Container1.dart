
import 'package:flutter/material.dart';



class Container1 extends StatelessWidget {

  const Container1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(125),
        boxShadow: [
          const BoxShadow(
            color: Color(0x77000000),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 0),
          )
        ],
      ),
    );
  }
}
