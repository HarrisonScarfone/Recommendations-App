import 'package:findstuff/screens/search_setup_screen.dart';
import 'package:findstuff/todos/searching_for_who.dart';
import 'package:flutter/material.dart';

class KeywordButton extends StatelessWidget {
  final String category;

  const KeywordButton(this.category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('added ' + this.category);
      },
      child: Card(
        child: Text(
          this.category,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
