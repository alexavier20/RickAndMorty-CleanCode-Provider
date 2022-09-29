import 'dart:collection';

import 'package:flutter/material.dart';

import '../../../domain/entities/character.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Character> _listFavorites = [];

  UnmodifiableListView<Character> get listFavorites =>
      UnmodifiableListView(_listFavorites);

  save(Character character) {
    if (!_listFavorites.contains(character)) _listFavorites.add(character);
    notifyListeners();
  }

  remove(Character character) {
    _listFavorites.removeWhere((e) => e.id == character.id);
    notifyListeners();
  }
}
