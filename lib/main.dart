import 'package:flutter/material.dart';
import 'package:waterly/screens/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:waterly/CurrentMl.dart';
import 'package:waterly/BasicCards1.dart';
import 'package:waterly/screens/history.dart';
import 'globals/AppState.dart';



late final SharedPreferences sharedPrefs;


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sharedPrefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CurrentMl>(create: (_) => CurrentMl()),
        ChangeNotifierProvider<AppState>(create: (_) => AppState()),
      ],
       child: Builder(
         builder: (context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Water Tracker App',
        theme: AppState.of(context).theme,
        initialRoute: 'HomePage',
        routes: {
        'HomePage': (context) => const HomePage(),
        'BasicCards1': (context) => const BasicCards1(),
        },
        ),
       ),
    );
  }
}