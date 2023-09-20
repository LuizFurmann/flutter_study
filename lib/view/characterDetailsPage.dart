import 'package:flutter/material.dart';
import 'package:flutter_study/model/character.dart';

class CharacterDetailsPage extends StatelessWidget {
  final Character character;
  const CharacterDetailsPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: const Text('Character Details'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16.0,
            ),
            Center(
              child: Image.network(
                character.img,
                width: 300,
              ),
            ),
            const SizedBox(
              height: 22.0,
            ),
            Text(
              character.name,
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text(
              character.nickname,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              character.portrayed,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 12.0,
            ),
          ],
        ),
      ),
    );
  }
}
