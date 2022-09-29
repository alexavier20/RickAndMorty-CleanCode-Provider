import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_characters/src/app_widget.dart';
import 'package:rick_and_morty_characters/src/presenter/states/provider/favorites_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => FavoritesProvider(),
    child: const AppWidget(),
  ));
}
