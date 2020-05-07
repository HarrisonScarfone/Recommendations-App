import 'package:findstuff/screens/search_setup_screen.dart';
import 'package:findstuff/todos/search_info.dart';
import 'package:flutter/material.dart';

import 'package:findstuff/screens/recommend_for_screen.dart';

class RecommendWhatButton extends StatelessWidget {

  final String category;

  const RecommendWhatButton(this.category);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 200.0,
      height: 100.0,
      child: new RaisedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RecommendForScreen()
              )
          );
        },
        child: Text(
          this.category,
          style: TextStyle(
              fontSize: 30
          ),
        ),
      ),
    );
  }
}
