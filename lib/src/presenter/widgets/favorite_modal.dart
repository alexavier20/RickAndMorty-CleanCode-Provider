// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FavoriteModal extends StatelessWidget {
  final Function removeFavoriteCallback;
  const FavoriteModal({
    Key? key,
    required this.removeFavoriteCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            Text('Voce deseja excluir este personagem dos favoritos?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
              backgroundColor: const Color(0xff7FD039),
              primary: const Color(0xff318F42)),
          child: const Text('Sim'),
          onPressed: () {
            removeFavoriteCallback();
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
