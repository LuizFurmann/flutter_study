import 'package:flutter/material.dart';

// Model
import '../model/character.dart';

// Page

class MyList extends StatelessWidget {
  final Character character;
  const MyList({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          ListTile(
            leading: Hero(
              tag: character.charId,
              child: CircleAvatar(
                backgroundImage: NetworkImage(character.img),
              ),
            ),
            title: Text(character.name),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(character.nickname),
              ],
            ),
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) =>
                          // CharacterDetailsPage(character: character)));
            },
          ),
          const Divider(
            thickness: 2.0,
          ),
        ],
      ),
    );
  }
}
