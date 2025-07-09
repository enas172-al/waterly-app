import 'package:flutter/material.dart';
import 'package:waterly/Waterlog1.dart';

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Empty extends StatefulWidget {
  const Empty({super.key});

  @override
  State<Empty> createState() => _EmptyState();
}

class _EmptyState extends State<Empty> {
  List<Map<String, dynamic>> todayLogs = [];

  @override
  void initState() {
    super.initState();
    _loadTodayLogs();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // إعادة تحميل السجلات عند العودة من شاشة أخرى
    Future.delayed(Duration.zero, () {
      _loadTodayLogs();
    });
  }

  Future<void> _loadTodayLogs() async {
    final prefs = await SharedPreferences.getInstance();
    final logsString = prefs.getString('water_logs');
    if (logsString == null) {
      setState(() => todayLogs = []);
      return;
    }
    final Map<String, dynamic> logsMap = jsonDecode(logsString);
    final now = DateTime.now();
    final todayKey = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    final todayList = logsMap[todayKey];
    setState(() => todayLogs = todayList != null ? List<Map<String, dynamic>>.from(todayList) : []);
  }

  Future<void> _deleteLog(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final logsString = prefs.getString('water_logs');
    if (logsString == null) return;
    final Map<String, dynamic> logsMap = jsonDecode(logsString);
    final now = DateTime.now();
    final todayKey = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    final todayList = logsMap[todayKey];
    if (todayList == null || index < 0 || index >= todayList.length) return;
    todayList.removeAt(index);
    logsMap[todayKey] = todayList;
    await prefs.setString('water_logs', jsonEncode(logsMap));
    _loadTodayLogs();
  }

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
              child: todayLogs.isEmpty
                  ? const Center(child: Text('لا يوجد سجلات اليوم'))
                  : ListView.separated(
                      itemCount: todayLogs.length,
                      itemBuilder: (context, index) {
                        final log = todayLogs[index];
                        return Waterlog1(
                          amount: log['amount'],
                          time: log['time'],
                          onDelete: () => _deleteLog(index),
                        );
                      },
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
