// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../domain/entities/character.dart';

class Details extends StatelessWidget {
  final Character character;

  const Details({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        title: Text(
          character.name,
          style: const TextStyle(
              color: Color(0xff318F42), fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xff7FD039),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundImage: NetworkImage(character.image),
                radius: 100.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              character.name,
              style:
                  const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Status: ${character.status}',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              character.gender,
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              character.species,
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
