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
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    _startFunction();
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

  List<PlayingCard> column0 = List(); // column 1
  List<PlayingCard> column1 = List(); // 2
  List<PlayingCard> column2 = List(); // 3
  List<PlayingCard> column3 = List(); // 4
  List<PlayingCard> column4 = List(); //5
  List<PlayingCard> column5 = List(); //6
  List<PlayingCard> column6 = List(); //7
  List<PlayingCard> column7 = List(); //8
  List<PlayingCard> column8 = List(); //9
  List<PlayingCard> column9 = List(); //10

  List<PlayingCard> deck = [];

  List<PlayingCard> cardDeckOpened = List();
  List<PlayingCard> cardDeckClosed = List();

  List<PlayingCard> finalDeck1 = List();
  List<PlayingCard> finalDeck2 = List();
  List<PlayingCard> finalDeck3 = List();
  List<PlayingCard> finalDeck4 = List();
  List<PlayingCard> finalDeck5 = List();
  List<PlayingCard> finalDeck6 = List();
  List<PlayingCard> finalDeck7 = List();
  List<PlayingCard> finalDeck8 = List();

  List<PlayingCard> _makeDeck() {
    List<PlayingCard> newDeck = [];

    CardSuit.values.forEach((suit) {
      CardType.values.forEach((value) {
        newDeck.add(
            PlayingCard(value: value, suit: CardSuit.hearts, isFaceUp: false));
      });
    });
    return newDeck;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Padding(
        padding: const EdgeInsets.only(top: 28.0, right: 10.0, left: 10.0),
        child: Column(
          children: <Widget>[
            // main columns
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 40.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                Container(
                  width: 40.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                Container(
                  width: 40.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                Container(
                  width: 40.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                Container(
                  width: 40.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                Container(
                  width: 40.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                Container(
                  width: 40.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                Container(
                  width: 40.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                Container(
                  width: 40.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                Container(
                  width: 40.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0)),
                )
              ],
            ),
            Spacer(
              flex: 2,
            ),
            // foundation and deck
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 40.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  Container(
                    width: 40.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  Container(
                    width: 40.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  Container(
                    width: 40.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  Container(
                    width: 40.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  Container(
                    width: 40.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  Container(
                    width: 40.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  Container(
                    width: 40.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  SizedBox(
                    width: 300.0,
                  ),
                  Container(
                    width: 40.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _startFunction() {
    deck = [];
    column0 = [];
    column1 = [];
    column2 = [];
    column3 = [];
    column4 = [];
    column5 = [];
    column6 = [];
    column7 = [];
    column8 = [];
    column9 = [];
    

  }
}
