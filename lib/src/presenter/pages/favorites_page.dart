import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_characters/src/presenter/states/provider/favorites_provider.dart';

import '../../domain/entities/character.dart';
import '../widgets/favorites_list.dart';
import '../widgets/favorites_not_found.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late FavoritesProvider favoritesProvider;

  @override
  Widget build(BuildContext context) {
    favoritesProvider = context.watch<FavoritesProvider>();
    List<Character> favorites = favoritesProvider.listFavorites;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Favoritos',
          style: TextStyle(
            color: Color(0xff318F42),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff7FD039),
      ),
      body: favorites.isEmpty
          ? const FavoritesNotFound()
          : FavoritesList(favoritesProvider: favoritesProvider),
    );
  }
}
