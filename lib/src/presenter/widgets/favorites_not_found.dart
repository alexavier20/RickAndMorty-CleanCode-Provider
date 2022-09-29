import 'package:flutter/material.dart';

class FavoritesNotFound extends StatelessWidget {
  const FavoritesNotFound({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: Text(
        "Não há favoritos nesta dimensão.",
        style: TextStyle(fontSize: 24.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}
