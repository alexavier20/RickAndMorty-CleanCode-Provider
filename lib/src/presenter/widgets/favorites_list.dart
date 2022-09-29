import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/src/presenter/states/provider/favorites_provider.dart';

import '../../domain/entities/character.dart';
import 'favorites_tile.dart';

class FavoritesList extends StatelessWidget {
  final FavoritesProvider favoritesProvider;
  const FavoritesList({Key? key, required this.favoritesProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Character> favorites = favoritesProvider.listFavorites;

    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final favorite = favorites[index];
        return FavoritesTile(
          favorite: favorite,
          removeFavoriteCallback: () {
            favoritesProvider.remove(favorite);
          },
        );
      },
    );
  }
}
