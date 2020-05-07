import 'package:flutter/material.dart';

import 'package:findstuff/widgets/recommend_for_button.dart';

class RecommendForScreen extends StatelessWidget {

  static const routeName = '/recommend_for_who_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Who are you looking for?')
          ],
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(5),
        childAspectRatio: 1.35,
        children: <Widget>[
          RecommendForButton('Girlfriend'),
          RecommendForButton('Boyfriend'),
          RecommendForButton('Mother'),
          RecommendForButton('Father'),
          RecommendForButton('Friend'),
          RecommendForButton('Work Friend'),
          RecommendForButton('Yourself'),
          RecommendForButton('Random'),
        ],
      ),
    );
  }
}
