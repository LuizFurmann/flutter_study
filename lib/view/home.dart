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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Smiple Tab Demo"),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "First",
              ),
              Tab(
                text: "Second",
              ),
              Tab(
                text: "Third",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              child: Column(children: [
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)))),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _characters.length,
                    itemBuilder: (context, index) {
                      if (!_isLoading) {
                        return MyList(character: _charactersDisplay[index]);
                      } else {
                        return const MyLoading();
                      }
                    },
                  ),
                ),
              ]),
            ),
            Container(
              color: Colors.blueGrey,
              child: const Center(
                child: Text(
                  "Second",
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              child: const Center(
                child: Text(
                  "Third",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
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
