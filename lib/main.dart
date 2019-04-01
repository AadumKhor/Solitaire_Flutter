import 'package:flutter/material.dart';
import 'package:solitaire_flutter/playscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solitaire',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: PlayScreen(),
    );
  }
}