import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solitaire_flutter/bottom_columns.dart';
import 'package:solitaire_flutter/moving_card.dart';
// import 'solitaire.dart';
import '../playing_card.dart';
import '../top_row.dart';

class InvertPlayScreen extends StatefulWidget {
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<InvertPlayScreen> {
  // the original deck of cards

  List<PlayingCard> deck = [];

  // list of cards in each column

  static List<PlayingCard> bottom0 = new List();
  static List<PlayingCard> bottom1 = new List();
  static List<PlayingCard> bottom2 = new List();
  static List<PlayingCard> bottom3 = new List();
  static List<PlayingCard> bottom4 = new List();
  static List<PlayingCard> bottom5 = new List();
  static List<PlayingCard> bottom6 = new List();

  List<List<PlayingCard>> bottomDecks = [
    bottom0,
    bottom1,
    bottom2,
    bottom3,
    bottom4,
    bottom5,
    bottom6
  ];

  // the cards that are shown and the cards that are not present

  List<PlayingCard> cardDeckOpened = new List();
  List<PlayingCard> cardDeckClosed = new List();

  //deck that is formed from ACe to King.

  List<PlayingCard> finalHeartsDeck = new List();
  List<PlayingCard> finalClubsDeck = new List();
  List<PlayingCard> finalSpadesDeck = new List();
  List<PlayingCard> finalDiamondsDeck = new List();

  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    _startFunction();
  }

  // make the deck of cards
  List<PlayingCard> makeDeck() {
    List<PlayingCard> newDeck = [];

    CardSuit.values.forEach((suit) {
      CardType.values.forEach((type) {
        newDeck.add(PlayingCard(
          value: type,
          suit: suit,
          isFaceUp: false,
        ));
      });
    });

    return newDeck;
  }

  // make the deck and shuffle it. then use the deck
  void playCards() {
    deck = makeDeck();
    // shuffle(deck);
    deck.shuffle();
  }

  // void top() {}

  // shuffle the cards in the deck
  // void shuffle<T>(List<T> list) {
  //   // method copied from stackoverflow
  //   Random random = new Random();
  //   int n = list.length;
  //   while (n > 1) {
  //     n--;
  //     int k = random.nextInt(n + 1);
  //     T value = list[k];
  //     list[k] = list[n];
  //     list[n] = value;
  //   }
  // }

  // List<Widget> _generateBoard() {}

  @override
  Widget build(BuildContext context) {
    // playCards();
    return Scaffold(
      backgroundColor: Colors.green,
      body: new Column(
        children: <Widget>[
          //implement top card widget here,
          SizedBox(
            height: 80.0,
          ),
          Text(
            'Solitaire',
            style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20.0,
          ),
          // the top row
          Row(
            children: <Widget>[
              Align(alignment: Alignment.centerLeft, child: _generateBoard()),
              Spacer(
                flex: 1,
              ),
              Align(
                  alignment: Alignment.centerRight, child: _buildFinalDecks()),
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: CardColumn(
                  cards: bottom0,
                  invert: true,
                  klondike: false,
                  isSpider1: false,
                  isSpider2: false,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      bottom0.addAll(cards);
                      int length = _getListFromIndex(index).length;
                      _getListFromIndex(index)
                          .removeRange(length - cards.length, length);
                      _refreshList(index);
                    });
                  },
                  columnIndex: 1,
                ),
              ),
              Expanded(
                child: CardColumn(
                  cards: bottom1,
                  invert: true,
                  klondike: false,
                  isSpider1: false,
                  isSpider2: false,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      bottom1.addAll(cards);
                      int length = _getListFromIndex(index).length;
                      _getListFromIndex(index)
                          .removeRange(length - cards.length, length);
                      _refreshList(index);
                    });
                  },
                  columnIndex: 2,
                ),
              ),
              Expanded(
                child: CardColumn(
                  cards: bottom2,
                  invert: true,
                  klondike: false,
                  isSpider1: false,
                  isSpider2: false,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      bottom2.addAll(cards);
                      int length = _getListFromIndex(index).length;
                      _getListFromIndex(index)
                          .removeRange(length - cards.length, length);
                      _refreshList(index);
                    });
                  },
                  columnIndex: 3,
                ),
              ),
              Expanded(
                child: CardColumn(
                  cards: bottom3,
                  invert: true,
                  klondike: false,
                  isSpider1: false,
                  isSpider2: false,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      bottom3.addAll(cards);
                      int length = _getListFromIndex(index).length;
                      _getListFromIndex(index)
                          .removeRange(length - cards.length, length);
                      _refreshList(index);
                    });
                  },
                  columnIndex: 4,
                ),
              ),
              Expanded(
                child: CardColumn(
                  cards: bottom4,
                  invert: true,
                  klondike: false,
                  isSpider1: false,
                  isSpider2: false,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      bottom4.addAll(cards);
                      int length = _getListFromIndex(index).length;
                      _getListFromIndex(index)
                          .removeRange(length - cards.length, length);
                      _refreshList(index);
                    });
                  },
                  columnIndex: 5,
                ),
              ),
              Expanded(
                child: CardColumn(
                  cards: bottom5,
                  invert: true,
                  klondike: false,
                  isSpider1: false,
                  isSpider2: false,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      bottom5.addAll(cards);
                      int length = _getListFromIndex(index).length;
                      _getListFromIndex(index)
                          .removeRange(length - cards.length, length);
                      _refreshList(index);
                    });
                  },
                  columnIndex: 6,
                ),
              ),
              Expanded(
                child: CardColumn(
                  cards: bottom6,
                  invert: true,
                  klondike: false,
                  isSpider1: false,
                  isSpider2: false,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      bottom6.addAll(cards);
                      int length = _getListFromIndex(index).length;
                      _getListFromIndex(index)
                          .removeRange(length - cards.length, length);
                      _refreshList(index);
                    });
                  },
                  columnIndex: 7,
                ),
              ),
            ],
          ),
          Spacer(
            flex: 1,
          ),
          FlatButton(
            color: Colors.black,
            child: new Text(
              'Reset Board',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              _startFunction();
            },
          )
        ],
      ),
    );
  }

  //just like unity the function will initiate the game
  void _startFunction() {
    deck = []; // empty deck
    bottom0 = []; // empty bottom rows
    bottom1 = [];
    bottom2 = [];
    bottom3 = [];
    bottom4 = [];
    bottom5 = [];
    bottom6 = [];
    // final bottomDecks = [bottom0 , bottom1 , bottom2 , bottom3 , bottom4 , bottom5 , bottom6];

    finalClubsDeck = []; // empty top rowws
    finalDiamondsDeck = [];
    finalHeartsDeck = [];
    finalSpadesDeck = [];

    cardDeckClosed = []; // cards that are not shown yet
    cardDeckOpened = []; // cards that are shown

    playCards(); // generates a shuffled deck
    // print(deck.length);
    Random random = Random(); // take a random number

    // laying cards on the screen using a pattern
    for (int i = 0; i <= 27; ++i) {
      int rand = random.nextInt(deck.length);
      // first card fisrt column
      if (i == 0) {
        PlayingCard card = deck[rand];
        bottom0.add(card
          ..isFaceUp = true
          ..isOpened = true);
        deck.removeAt(rand);
        // print("After 1st iteration : ${deck.length}" );
      } else if (i > 0 && i < 3) {
        //second card second column
        if (i == 2) {
          PlayingCard card = deck[rand];
          bottom1.add(card
            ..isFaceUp = true
            ..isOpened = true);
        } else {
          bottom1.add(deck[rand]);
        }
        deck.removeAt(rand);
        // print("After 2nd iteration : ${deck.length}" );
      } else if (i > 2 && i < 6) {
        //third card third column
        if (i == 5) {
          PlayingCard card = deck[rand];
          bottom2.add(card
            ..isFaceUp = true
            ..isOpened = true);
        } else {
          bottom2.add(deck[rand]);
        }
        deck.removeAt(rand);
        // print("After 3rd iteration : ${deck.length}" );
      } else if (i > 5 && i < 10) {
        // fourth card fourth column
        if (i == 9) {
          PlayingCard card = deck[rand];
          bottom3.add(card
            ..isFaceUp = true
            ..isOpened = true);
        } else {
          bottom3.add(deck[rand]);
        }
        deck.removeAt(rand);
        // print("After 4th iteration : ${deck.length}" );
      } else if (i > 9 && i < 15) {
        // 5th card 5th column
        if (i == 14) {
          PlayingCard card = deck[rand];
          bottom4.add(card
            ..isFaceUp = true
            ..isOpened = true);
        } else {
          bottom4.add(deck[rand]);
        }
        deck.removeAt(rand);
        // print("After 5th iteration : ${deck.length}" );
      } else if (i > 14 && i < 21) {
        if (i == 20) {
          //sixth card sixth column
          PlayingCard card = deck[rand];
          bottom5.add(card
            ..isFaceUp = true
            ..isOpened = true);
        } else {
          bottom5.add(deck[rand]);
        }
        deck.removeAt(rand);
        // print("After 6th iteration : ${deck.length}" );
      } else if (i > 20 && i <= 27) {
        //last card of the last column
        if (i == 27) {
          PlayingCard card = deck[rand];
          bottom6.add(card
            ..isFaceUp = true
            ..isOpened = true);
        } else {
          bottom6.add(deck[rand]);
        }
        deck.removeAt(rand);
        // print("After last iteration : ${deck.length}" );
      }
    }
    // print(deck.length);

    // we need to declare how many cards are left and how many are shown

    // for(var i = 0; i <=6 ; i++){
    //   bottomDecks[i] = deck.sublist(
    //     ((i * (i+1))~/2) , ((i * (i+1))~/2) + i +1
    //   );
    //   PlayingCard card = bottomDecks[i].elementAt(i);

    //   deck.remove(bottomDecks[i]);
    //   }
    cardDeckClosed = deck; // first assign it equal to the full deck
    // print(cardDeckClosed.length);
    // print(cardDeckClosed.last); /
    // then add the last cards of the above deck to the opened deck to make it open.
    // since it is open we know it is faceUP and opened is true
    cardDeckOpened.add(cardDeckClosed.removeAt(cardDeckClosed.length - 1)
      ..isFaceUp = true
      ..isOpened = true);
    // print(cardDeckOpened.length);
    // print(cardDeckClosed.length + cardDeckOpened.length);
    setState(() {}); // setting the state of the game
  }

  // checking if the top row has all the cards in order.
  void _refreshList(int index) {
    if (finalClubsDeck.length +
            finalDiamondsDeck.length +
            finalHeartsDeck.length +
            finalSpadesDeck.length ==
        52) {
      _handleWin();
    }

    setState(() {
      if (_getListFromIndex(index).length != 0) {
        _getListFromIndex(index)[_getListFromIndex(index).length - 1]
          ..isFaceUp = true
          ..isOpened = true;
      }
    });
  }

  // void repeatDeck(){

  // }

  // Handle a win condition
  void _handleWin() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Congratulations!"),
          content: Text("You Win!"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                _startFunction();
                Navigator.pop(context);
              },
              child: Text("Play again"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFinalDecks() {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TopRow(
              suit: CardSuit.hearts,
              cards: finalHeartsDeck,
              isKlondike: false,
              invert: true,
              onCardAccepted: (cards, index) {
                finalHeartsDeck.addAll(cards);
                int length = _getListFromIndex(index).length;
                _getListFromIndex(index)
                    .removeRange(length - cards.length, length);

                _refreshList(index);
              },
              columnIndex: 8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TopRow(
              suit: CardSuit.diamonds,
              cards: finalDiamondsDeck,
              isKlondike: false,
              invert: true,
              onCardAccepted: (cards, index) {
                finalDiamondsDeck.addAll(cards);
                int length = _getListFromIndex(index).length;
                _getListFromIndex(index)
                    .removeRange(length - cards.length, length);
                _refreshList(index);
              },
              columnIndex: 9,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TopRow(
              suit: CardSuit.spades,
              cards: finalSpadesDeck,
              isKlondike: false,
              invert: true,
              onCardAccepted: (cards, index) {
                finalSpadesDeck.addAll(cards);
                int length = _getListFromIndex(index).length;
                _getListFromIndex(index)
                    .removeRange(length - cards.length, length);
                _refreshList(index);
              },
              columnIndex: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TopRow(
              suit: CardSuit.clubs,
              cards: finalClubsDeck,
              isKlondike: false,
              invert: true,
              onCardAccepted: (cards, index) {
                finalClubsDeck.addAll(cards);
                int length = _getListFromIndex(index).length;
                _getListFromIndex(index)
                    .removeRange(length - cards.length, length);
                _refreshList(index);
              },
              columnIndex: 11,
            ),
          ),
        ],
      ),
    );
  }

  // function that will lay out our board on the staring of the game
  Widget _generateBoard() {
    return Container(
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                // if (cardDeckClosed.isEmpty) {
                //   cardDeckClosed.addAll(cardDeckOpened.map((card) {
                //     return card
                //       ..isFaceUp = false
                //       ..isOpened = false;
                //   }));
                // } else {
                cardDeckOpened.add(cardDeckClosed.removeLast()
                  ..isFaceUp = true
                  ..isOpened = true);
                // }
              });
            },
            child: Padding(
                padding: EdgeInsets.all(5.0),
                child: cardDeckClosed.isNotEmpty
                    ? TransformCard(
                        playingCard: cardDeckClosed.last,
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            // cardDeckOpened.reversed;
                            cardDeckClosed
                                .addAll(cardDeckOpened.reversed.map((card) {
                              return card
                                ..isFaceUp = false
                                ..isOpened = false;
                            }));
                            // cardDeckClosed.reversed;
                            cardDeckOpened = [];
                          });
                        },
                        child: Container(
                          height: 60.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              border: Border.all(width: 2.0)),
                        ))),
          ),
          cardDeckOpened.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TransformCard(
                    playingCard: cardDeckOpened.last,
                    attachedCards: [cardDeckOpened.last],
                    columnIndex: 0,
                  ),
                )
              : Container(
                  width: 40.0,
                  height: 60.0,
                )
        ],
      ),
    );
  }

  // list of playingcards that returns the appropriate list on the basis of the index given to it
  List<PlayingCard> _getListFromIndex(int index) {
    switch (index) {
      case 0:
        return cardDeckOpened;
      case 1:
        return bottom0;
      case 2:
        return bottom1;
      case 3:
        return bottom2;
      case 4:
        return bottom3;
      case 5:
        return bottom4;
      case 6:
        return bottom5;
      case 7:
        return bottom6;
      case 8:
        return finalHeartsDeck;
      case 9:
        return finalDiamondsDeck;
      case 10:
        return finalSpadesDeck;
      case 11:
        return finalClubsDeck;
      default:
        return null;
    }
  }
}
