import 'package:flutter/material.dart';
import 'package:solitaire_flutter/playing_card.dart';
import 'card_column.dart';
import 'transformed_card.dart';

class TopRow extends StatefulWidget {
  final CardSuit suit;
  final List<PlayingCard> cards;
  final CardAcceptCallback onCardAccepted;
  final int columnIndex;

  TopRow({this.suit, this.cards, this.onCardAccepted, this.columnIndex});

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
                attachedCards: [
                  widget.cards.last,
                ],
              );
      },
      onWillAccept: (value) {
        PlayingCard addedCard = value["cards"].last;

      if(widget.suit == addedCard.suit){
        if (addedCard.suit == widget.suit) {
          if (CardType.values.indexOf(addedCard.value) == widget.cards.length) {
            return true;
          }
          return false;
        }}
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
