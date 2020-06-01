import 'package:mobx/mobx.dart';

abstract class Game with Store {
  @observable
  var card = [
    's2',
    's3',
    's4',
    's5',
    's6',
    's7',
    's8',
    's9',
    's10',
    'sJ',
    'sK',
    'sQ',
    'sA',
    'h2',
    'h3',
    'h4',
    'h5',
    'h6',
    'h7',
    'h8',
    'h9',
    'h10',
    'hJ',
    'hK',
    'hQ',
    'hA',
    'd2',
    'd3',
    'd4',
    'd5',
    'd6',
    'd7',
    'd8',
    'd9',
    'd10',
    'dJ',
    'dK',
    'dQ',
    'dA',
    'c2',
    'c3',
    'c4',
    'c5',
    'c6',
    'c7',
    'c8',
    'c9',
    'c10',
    'cJ',
    'cK',
    'cQ',
    'cA',
  ];
  var reveal = true;

  @action
  void turn() {
    reveal = !reveal;
  }
}
