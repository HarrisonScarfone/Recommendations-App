import 'package:flutter/material.dart';

import 'package:findstuff/widgets/recommend_what_button.dart';

class RecommendWhatScreen extends StatelessWidget {
  static const routeName = '/recommend_what_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text('What Are You Looking For?')],
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: GridView.count(
        padding: EdgeInsets.all(5),
        childAspectRatio: 1.35,
        crossAxisCount: 2,
        children: <Widget>[
          // amazon api
          RecommendWhatButton('Gifts'),
          // imdb api
          RecommendWhatButton('Movies'),
          // yelp api
          RecommendWhatButton('Restaurants'),
          // google? tbd
          RecommendWhatButton('Memes')
        ],
      ),
    );
  }
}
