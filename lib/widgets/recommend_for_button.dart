import 'package:findstuff/screens/search_setup_screen.dart';
import 'package:findstuff/todos/search_info.dart';
import 'package:flutter/material.dart';

class RecommendForButton extends StatelessWidget {
  final String category;

  const RecommendForButton(this.category);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 50.0,
      height: 50.0,
      child: new RaisedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchSetupScreen(
                searchInfo: SearchInfo(this.category),
              ),
            ),
          );
        },
        child: Text(
          this.category,
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
