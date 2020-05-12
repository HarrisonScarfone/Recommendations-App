import 'package:findstuff/todos/pass_to_search_setup.dart';
import 'package:findstuff/utilities/default_keywords.dart';
import 'package:flutter/material.dart';

import 'package:findstuff/widgets/recommend_for_button.dart';

class RecommendForScreen extends StatelessWidget {
  final PassToSearchSetup passToSearchSetup;

  static const routeName = '/recommend_for_who_screen';

  RecommendForScreen({Key key, @required this.passToSearchSetup})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Who are you looking for?'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
            )
          ],
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(5),
        childAspectRatio: 1.35,
        children: <Widget>[
          RecommendForButton(
              'Girlfriend', 'assets/images/girlfriend.png', 5, 5, 75, 75),
          RecommendForButton(
              'Boyfriend', 'assets/images/boyfriend.png', 5, 5, 75, 75),
          RecommendForButton(
              'Mother', 'assets/images/mother.png', 5, 5, 75, 75),
          RecommendForButton(
              'Father', 'assets/images/father.png', 5, 5, 75, 75),
          RecommendForButton(
              'Friend', 'assets/images/detective.png', 5, 5, 75, 75),
          RecommendForButton(
              'Colleague', 'assets/images/detective.png', 5, 5, 75, 75),
          RecommendForButton(
              'Yourself', 'assets/images/yourself.png', 5, 5, 75, 75),
          RecommendForButton(
              'Random', 'assets/images/random.png', 5, 5, 75, 75),
        ],
      ),
    );
  }
}
