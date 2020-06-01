// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Game.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Game on _Game, Store {
  final _$cardAtom = Atom(name: '_Game.card');

  @override
  List<String> get card {
    _$cardAtom.reportRead();
    return super.card;
  }

  @override
  set card(List<String> value) {
    _$cardAtom.reportWrite(value, super.card, () {
      super.card = value;
    });
  }

  final _$_GameActionController = ActionController(name: '_Game');

  @override
  void turn() {
    final _$actionInfo =
        _$_GameActionController.startAction(name: '_Game.turn');
    try {
      return super.turn();
    } finally {
      _$_GameActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
card: ${card}
    ''';
  }
}
