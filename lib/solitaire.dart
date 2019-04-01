import 'package:flutter/material.dart';

List<String> suits = ["C", 'D', "H", "S"];
List<String> values = [
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10",
  "11",
  "12",
  '13'
];

List<String> deck = new List();

List<String> makeDeck() {
  List<String> newDeck = new List();

  for (String s in suits) {
    for (String v in values) {
      newDeck.add(s + v);
    }
  }

  return newDeck;
}

void playCards(){
  deck =makeDeck();

  for(String card in deck){
    print(card);
  }

}


void solitaireDeal() {
  for (int i = 0; i < 7; i++) {}
}

abstract class Solitaire extends StatelessWidget {
  playCards();
}