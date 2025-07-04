import 'package:flutter/material.dart';
import 'maincontent.dart';
import 'settings.dart';
import 'history.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff53c9ff),
        title: Text(
          'تذكير بشرب المياه',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: pageIndex,
        children: const [
          Settings(),
          MainContent(),
          History(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            label: 'الاعدادات',
            backgroundColor: const Color(0xffffffff),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.water_drop_outlined,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            label: 'الصفحة الرئيسية',
            backgroundColor: const Color(0xffffffff),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history_rounded,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            label: 'المحفوظات',
            backgroundColor: const Color(0xffffffff),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        unselectedItemColor: Theme.of(context).colorScheme.onSecondary,
        selectedItemColor: Theme.of(context).colorScheme.onSecondary,
        showSelectedLabels: true,
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
      ),
    );
  }
}
