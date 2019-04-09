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
      this.isFoundation = false});

  CardColor getCardColor() {
    if (suit == CardSuit.hearts || suit == CardSuit.diamonds) {
      return CardColor.red;
    } else {
      return CardColor.black;
    }
  }

  int getValue() {
    switch (value) {
      case (CardType.one):
        return 1;
      case (CardType.two):
        return 2;
      case (CardType.three):
        return 3;
      case (CardType.four):
        return 4;
      case (CardType.five):
        return 5;
      case (CardType.six):
        return 6;
      case (CardType.seven):
        return 7;
      case (CardType.eight):
        return 8;
      case (CardType.nine):
        return 9;
      case (CardType.ten):
        return 10;
      case (CardType.jack):
        return 11;
      case (CardType.queen):
        return 12;
        case (CardType.king):
        return 13;
        default:
        return null;
    }
  }
}
