import 'package:flutter/material.dart';
import 'package:solitaire_flutter/playscreen.dart';
import 'package:solitaire_flutter/screens/options_menu.dart';
import 'package:solitaire_flutter/screens/rules.dart';
import 'package:solitaire_flutter/screens/startscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solitaire',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: PlayScreen(),
      initialRoute: '.',
      routes: {
        '.':(context) => StartScreen(),
        '/menu' :(context) => Options(),
        '/game' : (context) => PlayScreen(),
        '/rules' : (context)=> Rules()
      },
    );
  }
}