import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/src/domain/entities/character.dart';
import 'package:rick_and_morty_characters/src/presenter/states/provider/favorites_provider.dart';
import 'package:rick_and_morty_characters/src/presenter/widgets/search_title.dart';

class SearchLIst extends StatelessWidget {
  final FavoritesProvider favoritesProvider;
  final List<Character> listCharacters;
  final ScrollController scrollController;

  const SearchLIst(
      {Key? key,
      required this.favoritesProvider,
      required this.listCharacters,
      required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: listCharacters.length,
      itemBuilder: (context, index) {
        final character = listCharacters[index];
        return SearchTile(
          character: character,
          favoritesProvider: favoritesProvider,
        );
      },
    );
  }
}
