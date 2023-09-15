import 'package:flutter/material.dart';
import 'package:flutter_study/view/search.dart';
import 'package:flutter_study/widgets/row_note.dart';

import '../controller/character_controller.dart';
import '../model/character.dart';
import 'list.dart';
import 'loading.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  final List<Character> _characters = <Character>[];
  List<Character> _charactersDisplay = <Character>[];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCharacters().then((value) {
      setState(() {
        _isLoading = false;
        _characters.addAll(value);
        _charactersDisplay = _characters;
        // print(_usersDisplay.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Luiz Furmann'),
      ),
      body: SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (searchText) {
                        searchText = searchText.toLowerCase();
                        setState(() {
                          _charactersDisplay = _characters.where((u) {
                            var nameLowerCase = u.name.toLowerCase();
                            var nicknameLowerCase = u.nickname.toLowerCase();
                            var portrayedLowerCase = u.portrayed.toLowerCase();
                            return nameLowerCase.contains(searchText) ||
                                nicknameLowerCase.contains(searchText) ||
                                portrayedLowerCase.contains(searchText);
                          }).toList();
                        });
                      },
                      decoration: const InputDecoration(
                          labelText: "Search",
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _characters.length,
                      itemBuilder: (context, index) {

                      if (!_isLoading) {
                      return MyList(character: _charactersDisplay[index]);
                      }
                       else {
                    return const MyLoading();
                    }
                      },
                    ),
                  ),
                ],
              )
      ),
    );
  }
}


AppBar myAppbar() {
  return AppBar(
    backgroundColor: Colors.blueAccent,
    title: Row(children: [Icon(Icons.menu, color: Colors.black, size: 30)]),
  );
}

Widget searchBox() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: const TextField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            maxWidth: 25,
          ),
          border: InputBorder.none,
          hintText: "Pesquisaar",
          hintStyle: TextStyle(color: Colors.grey)),
    ),
  );
}
