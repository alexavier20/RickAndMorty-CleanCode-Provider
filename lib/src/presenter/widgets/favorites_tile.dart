// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../domain/entities/character.dart';
import '../pages/details.dart';
import 'favorite_modal.dart';

class FavoritesTile extends StatelessWidget {
  final Character favorite;
  final Function removeFavoriteCallback;

  const FavoritesTile({
    Key? key,
    required this.favorite,
    required this.removeFavoriteCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> showConfirmatioDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return FavoriteModal(
            removeFavoriteCallback: removeFavoriteCallback,
          );
        },
      );
    }

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      elevation: 1,
      child: ListTile(
        title: Text(favorite.name),
        subtitle: Text(favorite.species),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(favorite.image),
          radius: 30.0,
          backgroundColor: Colors.grey[200],
        ),
        trailing: GestureDetector(
          onTap: () {
            showConfirmatioDialog();
          },
          child: const Icon(
            Icons.delete,
            size: 30.0,
            color: Color(0xffD7632D),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Details(character: favorite),
            ),
          );
        },
      ),
    );
  }
}
