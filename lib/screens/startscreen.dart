import 'dart:async';

import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
  
    super.initState();
      controller = new AnimationController(
        vsync: this, duration: Duration(seconds: 2));
    animation =
        new CurvedAnimation(parent: controller, curve: Curves.easeInCubic);
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, '/game'));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return FadeTransition(
      opacity: animation,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  colors: [Colors.green, Colors.white],
                  tileMode: TileMode.mirror,
                  center: Alignment.center,
                  radius: 3),
              image: DecorationImage(
                  image: AssetImage('assets/card_frame.png'),
                  fit: BoxFit.contain)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/card_suits'),
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('SOLITAIRE' , style: TextStyle(fontSize: 30.0 ,fontWeight: FontWeight.w800 , color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}
