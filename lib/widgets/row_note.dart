import 'package:flutter/material.dart';

class RowNote extends StatelessWidget {
  const RowNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
      ),
    );
  }
}
