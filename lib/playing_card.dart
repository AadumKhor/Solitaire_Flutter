import 'package:flutter/material.dart';

enum CardSuit {
  spades,
  hearts,
  diamonds,
  clubs,
}

enum CardType {
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  jack,
  queen,
  king
}

enum CardColor {
  red,
  black,
}

class PlayingCard {
  CardSuit suit;
  CardType value;
  bool isFaceUp;
  bool isOpened;
  bool isFoundation;

  PlayingCard(
      {@required this.suit,
      @required this.value,
      this.isFaceUp,
      this.isOpened,
      this.isFoundation = false
      });

  CardColor getCardColor() {
    if (suit == CardSuit.hearts || suit == CardSuit.diamonds) {
      return CardColor.red;
    } else {
      return CardColor.black;
    }
  }
}
