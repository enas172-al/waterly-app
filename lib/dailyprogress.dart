import 'package:flutter/material.dart';


class Dailyprogress extends StatelessWidget {

  const Dailyprogress({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Material(
          color: Theme.of(context).colorScheme.onPrimary,
          shape: const RoundedRectangleBorder(),
          child: Column(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 34,
                child: Row(
                  spacing: 56.646971225738525,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: null,
                      height: null,
                      child: Column(
                        spacing: 0,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: null,
                            height: null,
                            child: Text(
                              '7.7.2025',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                          SizedBox(
                            width: null,
                            height: null,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              spacing: 5,
                              children: [
                                SizedBox(
                                  width: null,
                                  height: null,
                                  child: Text(
                                    '1000 ml',
                                    style:
                                    Theme.of(context).textTheme.labelLarge,
                                  ),
                                ),
                                SizedBox(
                                  width: null,
                                  height: null,
                                  child: Text(
                                    '/',
                                    style:
                                    Theme.of(context).textTheme.labelLarge,
                                  ),
                                ),
                                SizedBox(
                                  width: null,
                                  height: null,
                                  child: Text(
                                    '2000 ml',
                                    style:
                                    Theme.of(context).textTheme.labelLarge,
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
                        Icons.check_circle_sharp,
                        color: Color(0xff02cc00),
                        size: 18,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 8,
                child: LinearProgressIndicator(
                  value: 0.5,
                  borderRadius: BorderRadius.circular(20),
                  backgroundColor: const Color(0xff011251),
                  color: const Color(0xff1c82f4),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
