import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study/view/home.dart';

void main() {
  runApp(const Luiz());
}

class Luiz extends StatelessWidget {
  const Luiz({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ToDoApp",
      home: Home(),
    );
  }
}
