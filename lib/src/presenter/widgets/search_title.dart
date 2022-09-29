import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/src/presenter/states/provider/favorites_provider.dart';

import '../../domain/entities/character.dart';
import '../pages/details.dart';

class SearchTile extends StatelessWidget {
  final Character character;
  final FavoritesProvider favoritesProvider;

  const SearchTile(
      {Key? key, required this.character, required this.favoritesProvider})
      : super(key: key);

  addFavorite(Character character) {
    if (verifyFavorited(character)) {
      favoritesProvider.remove(character);
    } else {
      favoritesProvider.save(character);
    }
  }

  verifyFavorited(Character character) {
    if (favoritesProvider.listFavorites
        .where((e) => e.id == character.id)
        .isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(character.name),
      subtitle: Text(character.species),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(character.image),
        radius: 30.0,
        backgroundColor: Colors.grey[200],
      ),
      trailing: GestureDetector(
        onTap: () {
          addFavorite(character);
        },
        child: Icon(
          Icons.star,
          size: 30.0,
          color: verifyFavorited(character)
              ? const Color(0xff7FD039)
              : Colors.grey,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(character: character),
          ),
        );
      },
    );
  }
}
