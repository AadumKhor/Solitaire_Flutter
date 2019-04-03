import 'package:flutter/material.dart';
// import 'playscreen.dart';
import 'bottom_columns.dart';
import 'playing_card.dart';

class TransformCard extends StatefulWidget {
  final PlayingCard playingCard;
  final double transformDistance;
  final int transformIndex;
  final int columnIndex;
  final List<PlayingCard> attachedCards;

  TransformCard(
      {@required this.playingCard,
      this.transformDistance = 15.0,
      this.transformIndex = 0,
      this.columnIndex,
      this.attachedCards});

  @override
  _TransformCardState createState() => _TransformCardState();
}

class _TransformCardState extends State<TransformCard> {
  
  @override
  Widget build(BuildContext context) {
    double y = widget.transformDistance * widget.transformIndex;
    return Transform(
      transform: Matrix4.identity()
        ..translate(0.0 , y , 0.0),
      child: _buildCards(),
    );
  }

  Widget _buildCards() {
    return !widget.playingCard.isFaceUp
        ? Container(
            height: 60.0,
            width: 40.0,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(width: 1.0, color: Colors.black),
            ),
          )
        : Draggable<Map>(
            child: _buildFaceUpCard(),
            feedback: CardColumn(
              cards: widget.attachedCards,
              columnIndex: 1,
              onCardsAdded: (card, position) {},
            ),
            childWhenDragging: _buildFaceUpCard(),
            data: {
              "cards": widget.attachedCards,
              "fromIndex": widget.columnIndex
            },
          );
  }

  Widget _buildFaceUpCard() {
    return Material(
      color: Colors.transparent,
      // child: Container(
      //   width: 40.0,
      //   height: 60.0,
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.circular(10.0),
      //     border: Border.all(width: 2.0 ,color: Colors.black)
      //   ),
      child: _assignPngToCard(),
      // ),
    );
  }
  // as the name says, this is not part of the UI
  Widget _assignPngToCard() {
    String s = _assignSuitToCard();
    String v = _assingValueToCard();
    return Container(
      width: 40.0,
      height: 60.0,
      decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: 0.5, color: Colors.black),
          image: DecorationImage(
              image: AssetImage('assets/${s + v}.png'), fit: BoxFit.cover)),
    );
  }

  // get the value of the card
  String _assingValueToCard() {
    String v;

    switch (widget.playingCard.value) {
      case (CardType.one):
        v = "1";
        break;
      case (CardType.two):
        v = "2";
        break;
      case (CardType.three):
        v = "3";
        break;
      case (CardType.four):
        v = "4";
        break;
      case (CardType.five):
        v = '5';
        break;
      case (CardType.six):
        v = '6';
        break;
      case (CardType.seven):
        v = '7';
        break;
      case (CardType.eight):
        v = '8';
        break;
      case (CardType.nine):
        v = '9';
        break;
      case (CardType.ten):
        v = '10';
        break;
      case (CardType.jack):
        v = '11';
        break;
      case (CardType.queen):
        v = '12';
        break;
      case (CardType.king):
        v = '13';
        break;
      default:
        v = "";
    }
    return v;
  }

  // to get the suit character from the check
  String _assignSuitToCard() {
    String s;

    switch (widget.playingCard.suit) {
      case (CardSuit.clubs):
        s = "C";
        break;
      case (CardSuit.diamonds):
        s = "D";
        break;
      case (CardSuit.hearts):
        s = "H";
        break;
      case (CardSuit.spades):
        s = "S";
        break;
      default:
        s = "";
    }
    return s;
  }
}
