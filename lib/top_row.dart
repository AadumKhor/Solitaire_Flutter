import 'package:flutter/material.dart';
import 'package:solitaire_flutter/playing_card.dart';
import 'bottom_columns.dart';
import 'moving_card.dart';

class TopRow extends StatefulWidget {
  final CardSuit suit;
  final List<PlayingCard> cards;
  final CardAcceptCallback onCardAccepted;
  final int columnIndex;
  final bool isKlondike;
  final bool isSpider1;
  final bool isSpider2;
  final bool invert;

  TopRow(
      {this.suit,
      this.cards,
      this.onCardAccepted,
      this.columnIndex,
      this.isKlondike = true,
      this.isSpider1 = false,
      this.isSpider2 = false,
      this.invert = false});

  _TopRowState createState() => _TopRowState();
}

class _TopRowState extends State<TopRow> {
  @override
  Widget build(BuildContext context) {
    return DragTarget<Map>(
      builder: (context, listOne, listTwo) {
        return widget.cards.length == 0
            ? Container(
                height: 60.0,
                width: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: _suitImage(),
              )
            : TransformCard(
                playingCard: widget.cards.last,
                columnIndex: widget.columnIndex,
                isFoundation: true,
                attachedCards: [
                  widget.cards.last,
                ],
              );
      },
      onWillAccept: (value) {
        if (widget.isKlondike) {
          PlayingCard addedCard = value["cards"].last;

          if (widget.suit == addedCard.suit) {
            if (addedCard.suit == widget.suit) {
              if (CardType.values.indexOf(addedCard.value) ==
                  widget.cards.length) {
                return true;
              }
            }
          }
        } else if (widget.isSpider1) {
          List<PlayingCard> addedCards = value["cards"];

          if (addedCards.first.value == CardType.king) {
            if (addedCards.last.value == CardType.one) {
              return true;
            } else {
              return false;
            }
          }
        } else if (widget.invert) {
          PlayingCard addedCard = value["cards"].last;

          if (widget.suit == addedCard.suit) {
            if (addedCard.suit == widget.suit) {
              if (CardType.values.indexOf(addedCard.value) -12 ==
                  widget.cards.length) {
                return true;
              }
            }
          }
        }
      },
      onAccept: (value) {
        widget.onCardAccepted(
          value["cards"],
          value["fromIndex"],
        );
      },
    );
  }

  // for diplaying top row suits

  Image _suitImage() {
    if (widget.suit == CardSuit.clubs) {
      return Image.asset('assets/clubs.png');
    } else if (widget.suit == CardSuit.diamonds) {
      return Image.asset('assets/diamonds.png');
    } else if (widget.suit == CardSuit.spades) {
      return Image.asset('assets/spades.png');
    } else if (widget.suit == CardSuit.hearts) {
      return Image.asset('assets/heart.png');
    }
  }
}
