import 'dart:math';

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

  // List<PlayingCard> cardDeckOpened = List(); no need for open deck since we know what is opened by the bool
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

  // void playCards() {
  //   deck = _makeDeck();
  //   deck.shuffle();
  //   // PlayingCard card;
  //   // for (card in deck) {
  //   //   print('${card.value.toString() + card.suit.toString()}');
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Padding(
        padding: const EdgeInsets.only(top: 28.0, right: 10.0, left: 10.0),
        child: Column(
          children: <Widget>[
            // main columns
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CardColumn(
                  columnIndex: 1,
                  cards: column0,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      column0.addAll(cards);
                      int length = _getListFromIndex(index).length;
                      _getListFromIndex(index)
                          .removeRange(length - cards.length, length);
                      _refreshList(index);
                    });
                  },
                ),
                CardColumn(
                  columnIndex: 2,
                  cards: column1,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      column0.addAll(cards);
                      int length = _getListFromIndex(index).length;
                      _getListFromIndex(index)
                          .removeRange(length - cards.length, length);
                      _refreshList(index);
                    });
                  },
                ),
                CardColumn(
                  columnIndex: 3,
                  cards: column2,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      column0.addAll(cards);
                      int length = _getListFromIndex(index).length;
                      _getListFromIndex(index)
                          .removeRange(length - cards.length, length);
                      _refreshList(index);
                    });
                  },
                ),
                CardColumn(
                  columnIndex: 4,
                  cards: column3,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      column0.addAll(cards);
                      int length = _getListFromIndex(index).length;
                      _getListFromIndex(index)
                          .removeRange(length - cards.length, length);
                      _refreshList(index);
                    });
                  },
                ),
                CardColumn(
                  columnIndex: 5,
                  cards: column4,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      column0.addAll(cards);
                      int length = _getListFromIndex(index).length;
                      _getListFromIndex(index)
                          .removeRange(length - cards.length, length);
                      _refreshList(index);
                    });
                  },
                ),
                CardColumn(
                  columnIndex: 6,
                  cards: column5,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      column0.addAll(cards);
                      int length = _getListFromIndex(index).length;
                      _getListFromIndex(index)
                          .removeRange(length - cards.length, length);
                      _refreshList(index);
                    });
                  },
                ),
                CardColumn(
                  columnIndex: 7,
                  cards: column6,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      column0.addAll(cards);
                      int length = _getListFromIndex(index).length;
                      _getListFromIndex(index)
                          .removeRange(length - cards.length, length);
                      _refreshList(index);
                    });
                  },
                ),
                CardColumn(
                  columnIndex: 8,
                  cards: column7,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      column0.addAll(cards);
                      int length = _getListFromIndex(index).length;
                      _getListFromIndex(index)
                          .removeRange(length - cards.length, length);
                      _refreshList(index);
                    });
                  },
                ),
                CardColumn(
                  columnIndex: 9,
                  cards: column8,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      column0.addAll(cards);
                      int length = _getListFromIndex(index).length;
                      _getListFromIndex(index)
                          .removeRange(length - cards.length, length);
                      _refreshList(index);
                    });
                  },
                ),
                CardColumn(
                  columnIndex: 10,
                  cards: column9,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      column0.addAll(cards);
                      int length = _getListFromIndex(index).length;
                      _getListFromIndex(index)
                          .removeRange(length - cards.length, length);
                      _refreshList(index);
                    });
                  },
                ),
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
    deck = []; // the main deck

    column0 = []; // empty columns from 0 to 9
    column1 = [];
    column2 = [];
    column3 = [];
    column4 = [];
    column5 = [];
    column6 = [];
    column7 = [];
    column8 = [];
    column9 = [];

    finalDeck1 = []; // empty foundation decks
    finalDeck2 = [];
    finalDeck3 = [];
    finalDeck4 = [];
    finalDeck5 = [];
    finalDeck6 = [];
    finalDeck7 = [];
    finalDeck8 = [];

    cardDeckClosed = [];

    deck.addAll(_makeDeck()); // add 52 cards of the same suit
    deck.addAll(_makeDeck()); // add another 52 cards
    deck.shuffle(); // shuffle once
    // deck.shuffle();

    // for(var card in deck){
    //   print(card.suit.toString());
    // }

    Random random = new Random();
    int rand = random.nextInt(deck.length);

    for (int i = 0; i <=55; i++) {
      if (i >= 0 && i <= 6) {
        PlayingCard card = deck[rand];
        if (i == 6) {
          column0.add(card..isFaceUp = true);
        } else {
          column0.add(card..isFaceUp = false);
        }
        deck.removeAt(rand);
      } else if (i >= 7 && i <= 12) {
        PlayingCard card = deck[rand];
        if (i == 12) {
          column1.add(card..isFaceUp = true);
        } else {
          column1.add(card..isFaceUp = false);
        }
        deck.removeAt(rand);
      }
      else if (i >= 13 && i <= 18) {
        PlayingCard card = deck[rand];
        if (i == 18) {
          column2.add(card..isFaceUp = true);
        } else {
          column2.add(card..isFaceUp = false);
        }
        deck.removeAt(rand);
      }
      else if (i >= 19 && i <= 24) {
        PlayingCard card = deck[rand];
        if (i == 24) {
          column3.add(card..isFaceUp = true);
        } else {
          column3.add(card..isFaceUp = false);
        }
        deck.removeAt(rand);
      }
      else if (i >= 25 && i <= 30) {
        PlayingCard card = deck[rand];
        if (i == 30) {
          column4.add(card..isFaceUp = true);
        } else {
          column4.add(card..isFaceUp = false);
        }
        deck.removeAt(rand);
      }
      else if (i >= 31 && i <= 35) {
        PlayingCard card = deck[rand];
        if (i == 35) {
          column5.add(card..isFaceUp = true);
        } else {
          column5.add(card..isFaceUp = false);
        }
        deck.removeAt(rand);
      }
      else if (i >= 36 && i <= 40) {
        PlayingCard card = deck[rand];
        if (i == 40) {
          column6.add(card..isFaceUp = true);
        } else {
          column6.add(card..isFaceUp = false);
        }
        deck.removeAt(rand);
      }
      else if (i >= 41 && i <= 45) {
        PlayingCard card = deck[rand];
        if (i == 45) {
          column7.add(card..isFaceUp = true);
        } else {
          column7.add(card..isFaceUp = false);
        }
        deck.removeAt(rand);
      }
      else if (i >= 46 && i <= 50) {
        PlayingCard card = deck[rand];
        if (i == 50) {
          column8.add(card..isFaceUp = true);
        } else {
          column8.add(card..isFaceUp = false);
        }
        deck.removeAt(rand);
      }
      else if (i >= 51 && i <= 55) {
        PlayingCard card = deck[rand];
        if (i == 55) {
          column9.add(card..isFaceUp = true);
        } else {
          column9.add(card..isFaceUp = false);
        }
        deck.removeAt(rand);
      }
      // if(i== 0 || i == 9 || i == 19 || i == 29 || i==39){
      //   PlayingCard card = deck[rand];
      //   column0.add(card ..isFaceUp = false ..isOpened = true ..isFoundation = false);
      //   deck.remove(card);
      // }
      // else if(i == 1 || i == 10 || i == 20 || i == 30 || i ==40){
      //   PlayingCard card = deck[rand];
      //   column1.add(card ..isFaceUp = false ..isFoundation = false);
      //   deck.remove(card);
      // }
      // else if(i == 2 || i == 11 || i == 21 || i == 31 || i ==41){

      // }
      // else if(i == 3 || i == 12 || i == 22 || i == 32 || i ==42){

      // }
      // else if(i == 4 || i == 13 || i == 23 || i == 33 || i ==43){

      // }
      // else if(i == 5 || i == 14 || i == 24 || i == 34){

      // }
      // else if(i == 6 || i == 15 || i == 25 || i == 35){

      // }
      // else if(i == 7 || i == 16 || i == 26 || i == 36){

      // }
      // else if(i == 8 || i == 17 || i == 27 || i == 37){

      // }
      // else if(i == 9 || i == 18 || i == 28 || i == 38){

      // }
      // else if()
    }

    cardDeckClosed = deck;
    print(cardDeckClosed.length);
  }

  void _refreshList(int index) {
    if (finalDeck1.length +
            finalDeck2.length +
            finalDeck3.length +
            finalDeck4.length +
            finalDeck5.length +
            finalDeck6.length +
            finalDeck7.length +
            finalDeck8.length ==
        104) {
      // _handleWin();
    }

    setState(() {
      if (_getListFromIndex(index).length != 0) {
        _getListFromIndex(index)[_getListFromIndex(index).length - 1]
          ..isFaceUp = true
          ..isOpened = true;
      }
    });
  }

  List<PlayingCard> _getListFromIndex(int index) {
    switch (index) {
      case 0:
        return cardDeckClosed;
      case 1:
        return column0;
      case 2:
        return column1;
      case 3:
        return column2;
      case 4:
        return column3;
      case 5:
        return column4;
      case 6:
        return column5;
      case 7:
        return column6;
      case 8:
        return column7;
      case 9:
        return column8;
      case 10:
        return column9;
      case 11:
        return finalDeck1;
      case 12:
        return finalDeck2;
      case 13:
        return finalDeck3;
      case 14:
        return finalDeck4;
      case 15:
        return finalDeck5;
      case 16:
        return finalDeck6;
      case 17:
        return finalDeck7;
      case 18:
        return finalDeck8;
      default:
        return null;
    }
  }
}
