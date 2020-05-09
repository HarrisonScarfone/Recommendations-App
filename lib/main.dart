import 'package:findstuff/screens/card_screen.dart';
import 'package:findstuff/screens/search_setup_screen.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/recommend_for_screen.dart';
import 'screens/card_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find Me Something',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey,
        accentColor: Colors.amberAccent,
      ),
      routes:{
        '/': (ctx) => HomeScreen(),
//        RecommendWhatScreen.routeName: (ctx) => RecommendWhatScreen(),
        RecommendForScreen.routeName: (ctx) => RecommendForScreen(),
        SearchSetupScreen.routeName: (ctx) => SearchSetupScreen(),
        CardScreen.routeName: (ctx) => CardScreen(),
      },
    );
  }
}