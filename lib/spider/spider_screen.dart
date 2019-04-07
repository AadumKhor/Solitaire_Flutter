import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solitaire_flutter/playing_card.dart';
import 'package:solitaire_flutter/moving_card.dart';
import 'package:solitaire_flutter/bottom_columns.dart';

class SpiderPlayScreen extends StatefulWidget {
  @override
  _SpiderPlayScreenState createState() => _SpiderPlayScreenState();
}

class _SpiderPlayScreenState extends State<SpiderPlayScreen> {

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
    );
  }
}