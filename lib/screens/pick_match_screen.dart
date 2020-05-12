import 'package:findstuff/screens/recommend_for_screen.dart';
import 'package:findstuff/screens/search_setup_screen.dart';
import 'package:findstuff/todos/pass_to_pick_match_screen.dart';
import 'package:flutter/material.dart';
import 'package:findstuff/todos/item_package.dart';

class PickMatchScreen extends StatefulWidget {
  static const routeName = '/pick_match_screen';

  final PassToPickMatchScreen passToPickMatchScreen;

  PickMatchScreen({Key key, @required this.passToPickMatchScreen})
      : super(key: key);

  @override
  _PickMatchScreenState createState() => _PickMatchScreenState();
}

class _PickMatchScreenState extends State<PickMatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick a Gift!'),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          Column(
            children: generateTextList(),
          ),
          Flexible(
            child: RaisedButton(
              onPressed: (){
                Navigator.pushNamed(context, RecommendForScreen.routeName);
              },
              child: Text(
                'Search Again',
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> generateTextList() {
    List<Widget> generatedText = List<Widget>();
    for (int i = 0; i < widget.passToPickMatchScreen.itemList.length; i++) {
      generatedText.add(
        Container(
          padding: EdgeInsets.all(15),
          child: Row(
            children: <Widget>[
              Text(widget.passToPickMatchScreen.itemList.elementAt(i).title),
              Divider(
                color: Colors.black,
              ),
            ],
          ),
        ),
      );
    }
    if (generatedText.isNotEmpty) {
      return generatedText;
    } else {
      generatedText.add(
        Container(
          padding: EdgeInsets.all(100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Text(
                  'You didnt pick any gifts :( :( :(',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
      return generatedText;
    }
  }
}
