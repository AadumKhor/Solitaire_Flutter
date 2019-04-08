import 'package:flutter/material.dart';
import 'package:solitaire_flutter/playscreen.dart';
import 'package:solitaire_flutter/screens/options_menu.dart';
import 'package:solitaire_flutter/screens/rules.dart';
import 'package:solitaire_flutter/screens/startscreen.dart';
import 'package:solitaire_flutter/spider/spider_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solitaire',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: PlayScreen(),
      initialRoute: '/menu',
      routes: {
        '.':(context) => StartScreen(),
        '/menu' :(context) => Options(),
        '/klondike' : (context) => PlayScreen(),
        '/rules' : (context)=> Rules(),
        '/spider':(context) => SpiderPlayScreen()
      },
    );
  }
}