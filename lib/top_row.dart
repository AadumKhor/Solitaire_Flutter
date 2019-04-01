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
                    // image: DecorationImage(
                    //   image: AssetImage(''),
                    //   fit: BoxFit.cover
                    // )
                    ),
              )
            : TransformCard(
              playingCard: widget.cards.last,
              attachedCards: [widget.cards.last],
              columnIndex: widget.columnIndex,
            );
      },
      onWillAccept: (value){
        PlayingCard addedCard = value["cards"].last;

        if(addedCard.suit == widget.suit){
          if(addedCard.value == widget.cards.last.value){
            return true;
          }
          return false;
        }

      },
      onAccept: (value){
        widget.onCardAccepted(
        value["cards"],
        value["index"],
        );
      },
    );
  }
}
