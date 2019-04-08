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
  final bool klondike;
  final bool isSpider1;
  final bool isSpider2;
  final bool invert;

  CardColumn(
      {@required this.cards,
      @required this.onCardsAdded,
      @required this.columnIndex,
      this.klondike = true,
      this.isSpider1 = false,
      this.isSpider2 = false,
      this.invert = false});

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
                    attachedCards:
                        widget.cards.sublist(index, widget.cards.length),
                    columnIndex: widget.columnIndex,
                  );
                }).toList(),
              );
            },
            onWillAccept: (value) {
              if (widget.klondike) {
                // If empty, accept
                List<PlayingCard> draggedCardEmptyList = value["cards"];
                PlayingCard draggedCardEmpty = draggedCardEmptyList.first;
                // print(draggedCardEmpty.value);

                if (widget.cards.length == 0) {
                  // print(widget.cards);
                  if (draggedCardEmpty.value == CardType.king) {
                    return true;
                  } else {
                    return false;
                  }
                }

                // Get dragged cards list
                List<PlayingCard> draggedCards = value["cards"];
                PlayingCard firstCard = draggedCards.first;
                int lastColumnIndex =
                    CardType.values.indexOf(widget.cards.last.value);
                int firstCardIndex =
                    CardType.values.indexOf(draggedCards.first.value);

                if (widget.cards.last.getCardColor() ==
                    firstCard.getCardColor()) {
                  return false;
                } else if (lastColumnIndex != firstCardIndex + 1) {
                  return false;
                } else if (lastColumnIndex == firstCardIndex + 1) {
                  return true;
                } else {
                  return true;
                }
              }
              //spider 1 logic
              else if (widget.isSpider1) {
                List<PlayingCard> draggedCard = value["cards"];
                PlayingCard card = draggedCard.first;

                if (widget.cards.length == 0) {
                  if (card.value == CardType.king) {
                    return true;
                  } else {
                    return false;
                  }
                }

                int lastCardIndex =
                    CardType.values.indexOf(widget.cards.last.value);
                int firstCardIndex = CardType.values.indexOf(card.value);

                if (widget.cards.last.suit == card.suit) {
                  if (lastCardIndex != firstCardIndex + 1) {
                    return false;
                  } else {
                    return true;
                  }
                }
              } else if (widget.invert) {
                List<PlayingCard> draggedCardEmptyList = value["cards"];
                PlayingCard draggedCardEmpty = draggedCardEmptyList.first;
                // print(draggedCardEmpty.value);

                if (widget.cards.length == 0) {
                  // print(widget.cards);
                  if (draggedCardEmpty.value == CardType.one) {
                    return true;
                  } else {
                    return false;
                  }
                }
                // Get dragged cards list
                List<PlayingCard> draggedCards = value["cards"];
                PlayingCard firstCard = draggedCards.first;
                int lastColumnIndex =
                    CardType.values.indexOf(widget.cards.last.value);
                int firstCardIndex =
                    CardType.values.indexOf(draggedCards.first.value);

                if (widget.cards.last.getCardColor() ==
                    firstCard.getCardColor()) {
                  return false;
                } else if (lastColumnIndex != firstCardIndex - 1) {
                  return false;
                } else if (lastColumnIndex == firstCardIndex - 1) {
                  return true;
                } else {
                  return true;
                }
              }
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
