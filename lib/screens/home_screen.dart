import 'package:findstuff/screens/recommend_for_screen.dart';
import 'package:findstuff/screens/recommend_what_screen.dart';
import 'package:flutter/material.dart';

import 'swiping_screen.dart';

class HomeScreen extends StatefulWidget {

  static const routeName = '/main_menu_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void goToRecommendWhatScreen(){
    Navigator.of(context).pushNamed(RecommendWhatScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image(
                image: AssetImage('assets/images/detective.png'),
                height: 150,
                width: 150,
              )
            ),
            new Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
            ),
            ButtonTheme(
              minWidth: 200.0,
              height: 100.0,
              child: new RaisedButton(
                  onPressed: () {
                    goToRecommendWhatScreen();
                  },
                  child: Text(
                    'Find me something!',
                    style: TextStyle(
                      fontSize: 30
                    ),
                  ),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
            ),
            Container(
              child: Text(
                'Let us recommend it.',
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
