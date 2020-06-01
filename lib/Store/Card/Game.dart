import 'package:mobx/mobx.dart';

part 'Game.g.dart';

class Game = _Game with _$Game;

abstract class _Game with Store {
  @observable
  var card = [
    's2',
    's3',
    's4',
    'sA',
    'h2',
    'h3',
    'h4',
    'hA',
    'd2',
    'd3',
    'd4',
    'dA',
    'c2',
    'c3',
    'c4',
    'cA',
  ];
  var reveal = true;

  @action
  void turn() {
    reveal = !reveal;
  }
}
