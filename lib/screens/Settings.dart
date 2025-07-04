import 'package:flutter/material.dart';


class Settings extends StatelessWidget {

  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 13,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: null,
          child: Material(
            color: Theme.of(context).colorScheme.onPrimary,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            borderOnForeground: false,
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Row(
                spacing: 43.372589111328125,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: null,
                    height: 24,
                    child: Row(
                      spacing: 8,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: null,
                          height: null,
                          child: Icon(
                            Icons.track_changes,
                            color: Color(0xfff9d91d),
                          ),
                        ),
                        SizedBox(
                          width: null,
                          height: 23,
                          child: Text(
                            'الهدف اليومي ',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: null,
                    height: null,
                    child: Text(
                      '2000 ml',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: null,
          child: Material(
            color: Theme.of(context).colorScheme.onPrimary,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            borderOnForeground: false,
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Row(
                spacing: 43.372589111328125,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 84,
                    child: Row(
                      spacing: 8,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: null,
                          height: null,
                          child: Icon(
                            Icons.notifications_rounded,
                            color: Color(0xfff9d91d),
                          ),
                        ),
                        SizedBox(
                          width: null,
                          height: 23,
                          child: Text(
                            'تنبيهات',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: null,
                    height: null,
                    child: Text(
                      'كل ساعتين ',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 9,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            child: Container(
              decoration: const BoxDecoration(color: Color(0xffbebcbc)),
            ),
          ),
        )
      ],
    );
  }
}
