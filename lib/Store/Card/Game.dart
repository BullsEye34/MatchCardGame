import 'package:mobx/mobx.dart';

part 'Game.g.dart';

class Game = _Game with _$Game;

abstract class _Game with Store {
  @observable
  var card = [
    's2',
    'sA',
    'h2',
    'hA',
    'd2',
    'dA',
    'c2',
    'cA',
  ];
  var reveal = true;

  @action
  void turn() {
    reveal = !reveal;
  }
}
