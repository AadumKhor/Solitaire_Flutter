import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solitaire_flutter/playing_card.dart';
import 'package:solitaire_flutter/moving_card.dart';
import 'package:solitaire_flutter/bottom_columns.dart';
import 'package:solitaire_flutter/top_row.dart';

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
      backgroundColor: Colors.blue,
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
                  isSpider1: true,
                  klondike: false,
                  isSpider2: true,
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
                  isSpider1: true,
                  klondike: false,
                  isSpider2: true,
                  cards: column1,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      column1.addAll(cards);
                      int length = _getListFromIndex(index).length;
                      _getListFromIndex(index)
                          .removeRange(length - cards.length, length);
                      _refreshList(index);
                    });
                  },
                ),
                CardColumn(
                  columnIndex: 3,
                  isSpider1: true,
                  klondike: false,
                  isSpider2: true,
                  cards: column2,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      column2.addAll(cards);
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
                  isSpider1: true,
                  klondike: false,
                  isSpider2: true,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      column3.addAll(cards);
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
                  isSpider1: true,
                  klondike: false,
                  isSpider2: true,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      column4.addAll(cards);
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
                  isSpider1: true,
                  klondike: false,
                  isSpider2: true,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      column5.addAll(cards);
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
                  isSpider1: true,
                  klondike: false,
                  isSpider2: true,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      column6.addAll(cards);
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
                  isSpider1: true,
                  klondike: false,
                  isSpider2: true,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      column7.addAll(cards);
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
                  isSpider1: true,
                  klondike: false,
                  isSpider2: true,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      column8.addAll(cards);
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
                  isSpider1: true,
                  klondike: false,
                  isSpider2: true,
                  onCardsAdded: (cards, index) {
                    setState(() {
                      column9.addAll(cards);
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
              flex: 1,
            ),
            // foundation and deck
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: _buildFinalDecks(),
              // child: Row(
              //   children: <Widget>[
              //     Container(
              //       width: 40.0,
              //       height: 60.0,
              //       decoration: BoxDecoration(
              //           border: Border.all(width: 2.0, color: Colors.black),
              //           borderRadius: BorderRadius.circular(10.0)),
              //     ),
              //     Container(
              //       width: 40.0,
              //       height: 60.0,
              //       decoration: BoxDecoration(
              //           border: Border.all(width: 2.0, color: Colors.black),
              //           borderRadius: BorderRadius.circular(10.0)),
              //     ),
              //     Container(
              //       width: 40.0,
              //       height: 60.0,
              //       decoration: BoxDecoration(
              //           border: Border.all(width: 2.0, color: Colors.black),
              //           borderRadius: BorderRadius.circular(10.0)),
              //     ),
              //     Container(
              //       width: 40.0,
              //       height: 60.0,
              //       decoration: BoxDecoration(
              //           border: Border.all(width: 2.0, color: Colors.black),
              //           borderRadius: BorderRadius.circular(10.0)),
              //     ),
              //     Container(
              //       width: 40.0,
              //       height: 60.0,
              //       decoration: BoxDecoration(
              //           border: Border.all(width: 2.0, color: Colors.black),
              //           borderRadius: BorderRadius.circular(10.0)),
              //     ),
              //     Container(
              //       width: 40.0,
              //       height: 60.0,
              //       decoration: BoxDecoration(
              //           border: Border.all(width: 2.0, color: Colors.black),
              //           borderRadius: BorderRadius.circular(10.0)),
              //     ),
              //     Container(
              //       width: 40.0,
              //       height: 60.0,
              //       decoration: BoxDecoration(
              //           border: Border.all(width: 2.0, color: Colors.black),
              //           borderRadius: BorderRadius.circular(10.0)),
              //     ),
              //     Container(
              //       width: 40.0,
              //       height: 60.0,
              //       decoration: BoxDecoration(
              //           border: Border.all(width: 2.0, color: Colors.black),
              //           borderRadius: BorderRadius.circular(10.0)),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(10.0),
              //       child: FlatButton(
              //         color: Colors.black,
              //         onPressed: () {
              //           setState(() {
              //             _startFunction();
              //           });
              //         },
              //         child: Text(
              //           'Reset Board',
              //           style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 25.0,
              //               fontWeight: FontWeight.w400),
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       width: 140.0,
              //     ),
              //     GestureDetector(
              //       onTap: () {
              //         _dealCards();
              //       },
              //       child: cardDeckClosed.isNotEmpty
              //           ? Container(
              //               width: 40.0,
              //               height: 60.0,
              //               decoration: BoxDecoration(
              //                   color: Colors.redAccent,
              //                   border:
              //                       Border.all(width: 2.0, color: Colors.black),
              //                   borderRadius: BorderRadius.circular(10.0)),
              //             )
              //           : Container(
              //               width: 40.0,
              //               height: 60.0,
              //               decoration: BoxDecoration(
              //                   border:
              //                       Border.all(width: 2.0, color: Colors.black),
              //                   color: Colors.black26),
              //             ),
              //     )
              //   ],
              // ),
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

    for (int i = 0; i <= 55; i++) {
      if (i >= 0 && i <= 5) {
        PlayingCard card = deck[rand];
        if (i == 5) {
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
      } else if (i >= 13 && i <= 18) {
        PlayingCard card = deck[rand];
        if (i == 18) {
          column2.add(card..isFaceUp = true);
        } else {
          column2.add(card..isFaceUp = false);
        }
        deck.removeAt(rand);
      } else if (i >= 19 && i <= 24) {
        PlayingCard card = deck[rand];
        if (i == 24) {
          column3.add(card..isFaceUp = true);
        } else {
          column3.add(card..isFaceUp = false);
        }
        deck.removeAt(rand);
      } else if (i >= 25 && i <= 30) {
        PlayingCard card = deck[rand];
        if (i == 30) {
          column4.add(card..isFaceUp = true);
        } else {
          column4.add(card..isFaceUp = false);
        }
        deck.removeAt(rand);
      } else if (i >= 31 && i <= 35) {
        PlayingCard card = deck[rand];
        if (i == 35) {
          column5.add(card..isFaceUp = true);
        } else {
          column5.add(card..isFaceUp = false);
        }
        deck.removeAt(rand);
      } else if (i >= 36 && i <= 40) {
        PlayingCard card = deck[rand];
        if (i == 40) {
          column6.add(card..isFaceUp = true);
        } else {
          column6.add(card..isFaceUp = false);
        }
        deck.removeAt(rand);
      } else if (i >= 41 && i <= 45) {
        PlayingCard card = deck[rand];
        if (i == 45) {
          column7.add(card..isFaceUp = true);
        } else {
          column7.add(card..isFaceUp = false);
        }
        deck.removeAt(rand);
      } else if (i >= 46 && i <= 50) {
        PlayingCard card = deck[rand];
        if (i == 50) {
          column8.add(card..isFaceUp = true);
        } else {
          column8.add(card..isFaceUp = false);
        }
        deck.removeAt(rand);
      } else if (i >= 51 && i <= 54) {
        PlayingCard card = deck[rand];
        if (i == 54) {
          column9.add(card..isFaceUp = true);
        } else {
          column9.add(card..isFaceUp = false);
        }
        deck.removeAt(rand);
      }
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

  Widget _buildFinalDecks() {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TopRow(
              isSpider1: true,
              isKlondike: false,
              // suit: CardSuit.clubs,
              // cards: finalClubsDeck,
              onCardAccepted: (cards, index) {
                finalDeck1.addAll(cards);
                int length = _getListFromIndex(index).length;
                _getListFromIndex(index)
                    .removeRange(length - cards.length, length);
                _refreshList(index);
              },
              columnIndex: 11,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TopRow(
              isSpider1: true,
              isKlondike: false,
              // suit: CardSuit.clubs,
              // cards: finalClubsDeck,
              onCardAccepted: (cards, index) {
                finalDeck2.addAll(cards);
                int length = _getListFromIndex(index).length;
                _getListFromIndex(index)
                    .removeRange(length - cards.length, length);
                _refreshList(index);
              },
              columnIndex: 12,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TopRow(
              isSpider1: true,
              isKlondike: false,
              // suit: CardSuit.clubs,
              // cards: finalClubsDeck,
              onCardAccepted: (cards, index) {
                finalDeck3.addAll(cards);
                int length = _getListFromIndex(index).length;
                _getListFromIndex(index)
                    .removeRange(length - cards.length, length);
                _refreshList(index);
              },
              columnIndex: 13,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TopRow(
              isSpider1: true,
              isKlondike: false,
              // suit: CardSuit.clubs,
              // cards: finalClubsDeck,
              onCardAccepted: (cards, index) {
                finalDeck4.addAll(cards);
                int length = _getListFromIndex(index).length;
                _getListFromIndex(index)
                    .removeRange(length - cards.length, length);
                _refreshList(index);
              },
              columnIndex: 14,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TopRow(
              isSpider1: true,
              isKlondike: false,
              // suit: CardSuit.clubs,
              // cards: finalClubsDeck,
              onCardAccepted: (cards, index) {
                finalDeck5.addAll(cards);
                int length = _getListFromIndex(index).length;
                _getListFromIndex(index)
                    .removeRange(length - cards.length, length);
                _refreshList(index);
              },
              columnIndex: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TopRow(
              isSpider1: true,
              isKlondike: false,
              // suit: CardSuit.clubs,
              // cards: finalClubsDeck,
              onCardAccepted: (cards, index) {
                finalDeck6.addAll(cards);
                int length = _getListFromIndex(index).length;
                _getListFromIndex(index)
                    .removeRange(length - cards.length, length);
                _refreshList(index);
              },
              columnIndex: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TopRow(
              isSpider1: true,
              isKlondike: false,
              // suit: CardSuit.clubs,
              // cards: finalClubsDeck,
              onCardAccepted: (cards, index) {
                finalDeck7.addAll(cards);
                int length = _getListFromIndex(index).length;
                _getListFromIndex(index)
                    .removeRange(length - cards.length, length);
                _refreshList(index);
              },
              columnIndex: 17,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TopRow(
              isSpider1: true,
              isKlondike: false,
              // suit: CardSuit.clubs,
              // cards: finalClubsDeck,
              onCardAccepted: (cards, index) {
                finalDeck8.addAll(cards);
                int length = _getListFromIndex(index).length;
                _getListFromIndex(index)
                    .removeRange(length - cards.length, length);
                _refreshList(index);
              },
              columnIndex: 18,
            ),
          ),
        ],
      ),
    );
  }

  void _dealCards() {
    if (cardDeckClosed.isNotEmpty) {
      setState(() {
        column0.add(cardDeckClosed.removeLast()..isFaceUp = true);
        column1.add(cardDeckClosed.removeLast()..isFaceUp = true);
        column2.add(cardDeckClosed.removeLast()..isFaceUp = true);
        column3.add(cardDeckClosed.removeLast()..isFaceUp = true);
        column4.add(cardDeckClosed.removeLast()..isFaceUp = true);
        column5.add(cardDeckClosed.removeLast()..isFaceUp = true);
        column6.add(cardDeckClosed.removeLast()..isFaceUp = true);
        column7.add(cardDeckClosed.removeLast()..isFaceUp = true);
        column8.add(cardDeckClosed.removeLast()..isFaceUp = true);
        column9.add(cardDeckClosed.removeLast()..isFaceUp = true);
      });
    } else {
      return null;
    }
  }
}
