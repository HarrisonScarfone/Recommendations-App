import 'package:findstuff/todos/pass_to_cards_screen.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {

  static const routeName = '/card_screen';
  final SearchPackage searchPackage;

  CardScreen({Key key, @required this.searchPackage})
      : super(key: key);

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text(widget.searchPackage.keywords.toString()),
          Text(widget.searchPackage.highPrice.toString()),
          Text(widget.searchPackage.lowPrice.toString()),
          Text(widget.searchPackage.age.toString()),
          Text(widget.searchPackage.forWho),
        ],
      ),
    );
  }
}
