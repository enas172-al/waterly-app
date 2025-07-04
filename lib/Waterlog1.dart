import 'package:flutter/material.dart';

class Waterlog1 extends StatelessWidget {

  const Waterlog1({super.key});

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
          spacing: 67.384765625,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(

              child: Row(
                spacing: 10,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(

                    child: Icon(
                      Icons.water_drop,
                      color: Color(0xff25abe4),
                      size: 26,
                    ),
                  ),
                  SizedBox(
                    width: 39.615234375,
                    height: null,
                    child: Column(
                      spacing: 0,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(

                          child: Text(
                            '500 ml',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                        SizedBox(

                          child: Text(
                            '11:00',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: null,
              height: null,
              child: Icon(
                Icons.delete_outlined,
                color: Color(0x51000000),
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
