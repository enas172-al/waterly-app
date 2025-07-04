import 'package:flutter/material.dart';
import 'package:waterly/Waterlog1.dart';

class Empty extends StatelessWidget {
  const Empty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff53c9ff),
        title: Text(
          'سجلات اليوم ',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.separated(
                itemCount: 3,
                itemBuilder: (context, index) => const Waterlog1(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                  width: 20,
                ),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
