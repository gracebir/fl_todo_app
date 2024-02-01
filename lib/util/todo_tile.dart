import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(25),
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Text("Make a choise"),
          decoration: BoxDecoration(color: Colors.yellow),
        ));
  }
}
