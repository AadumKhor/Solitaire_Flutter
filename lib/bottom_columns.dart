import 'package:flutter/material.dart';
import 'package:solitaire_flutter/moving_card.dart';
// import 'playscreen.dart';
import 'playing_card.dart';

typedef Null CardAcceptCallback(List<PlayingCard> card, int fromIndex);

// This is a stack of overlayed cards (implemented using a stack)
class CardColumn extends StatefulWidget {

  // List of cards in the stack
  final List<PlayingCard> cards;

  // Callback when card is added to the stack
  final CardAcceptCallback onCardsAdded;

  // The index of the list in the game
  final int columnIndex;

  CardColumn(
      {@required this.cards,
      @required this.onCardsAdded,
      @required this.columnIndex});

  @override
  _CardColumnState createState() => _CardColumnState();
}

class _CardColumnState extends State<CardColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          //alignment: Alignment.topCenter,
          height: 13.0 * 15.0,
          width: 50.0,
          margin: EdgeInsets.all(2.0),
          child: DragTarget<Map>(
            builder: (context, listOne, listTwo) {
              return Stack(
                children: widget.cards.map((card) {
                  int index = widget.cards.indexOf(card);
                  return TransformCard(
                    playingCard: card,
                    transformIndex: index,
                    attachedCards: widget.cards.sublist(index, widget.cards.length),
                    columnIndex: widget.columnIndex,
                  );
                }).toList(),
              );
            },
            onWillAccept: (value) {
              // If empty, accept
              if (widget.cards.length == 0) {
                return true;
              }

              // Get dragged cards list
              List<PlayingCard> draggedCards = value["cards"];
              PlayingCard firstCard = draggedCards.first;
              if (firstCard.getCardColor == CardColor.red) {
                if (widget.cards.last.getCardColor == CardColor.red) {
                  return false;
                }

                int lastColumnCardIndex = CardType.values.indexOf(widget.cards.last.value);
                int firstDraggedCardIndex = CardType.values.indexOf(firstCard.value);

                if(lastColumnCardIndex != firstDraggedCardIndex + 1) {
                  return false;
                }

              } else {
                if (widget.cards.last.getCardColor == CardColor.black) {
                  return false;
                }

                int lastColumnCardIndex = CardType.values.indexOf(widget.cards.last.value);
                int firstDraggedCardIndex = CardType.values.indexOf(firstCard.value);

                if(lastColumnCardIndex != firstDraggedCardIndex + 1) {
                  return false;
                }

              }
              return true;
            },
            onAccept: (value) {
              widget.onCardsAdded(
                value["cards"],
                value["fromIndex"],
              );
            },
          ),
        ),
      ],
    );
  }
}
