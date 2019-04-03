import 'package:flutter/material.dart';

class Options extends StatefulWidget {
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: [Colors.lime,Colors.green],
                tileMode: TileMode.clamp,
                center:
                    Alignment.center,
                radius: 1.5),
            image: DecorationImage(
                image: AssetImage('assets/card_frame.png'),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/card_suits'),
              fit: BoxFit.cover,
            ),
           
            Align(
              alignment: Alignment.topCenter,
                          child: Text(
                'SOLITAIRE',
                style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            FlatButton(
              child: Text(
                'Play Game',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w300),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/game');
              },
            )
          ],
        ),
      ),
    );
  }
}
