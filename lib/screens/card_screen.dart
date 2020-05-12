import 'package:findstuff/screens/pick_match_screen.dart';
import 'package:findstuff/todos/pass_to_cards_screen.dart';
import 'package:findstuff/todos/item_package.dart';
import 'package:findstuff/todos/pass_to_pick_match_screen.dart';
import 'package:flutter/material.dart';
import 'package:findstuff/utilities/match_card.dart';

class CardScreen extends StatefulWidget {
  static const routeName = '/card_screen';
  final SearchPackage searchPackage;

  CardScreen({Key key, @required this.searchPackage}) : super(key: key);

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  List<Widget> cardList;
  List<ItemPackage> matches = List<ItemPackage>();

  void _removeCard(index) {
    setState(() {
      cardList.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    cardList = _getMatchCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('Flip Through Some Options'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: cardList,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 25),
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PickMatchScreen(
                      passToPickMatchScreen:
                          new PassToPickMatchScreen(this.matches),
                    ),
                  ),
                );
              },
              child: Text(
                'See my matches!',
                style: TextStyle(fontSize: 30),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _getMatchCards() {
    List<MatchCard> cards = new List();

    for (int i = 0; i < widget.searchPackage.keywords.length; i++) {
      if (widget.searchPackage.keywords.elementAt(i).isEmpty) {
        continue;
      }
      cards.add(MatchCard(widget.searchPackage.keywords.elementAt(i)));
    }

    List<Widget> cardList = new List();
    for (int x = 0; x < cards.length; x++) {
      cardList.add(
        Positioned(
          top: 10,
          child: Draggable(
            onDraggableCanceled: (Velocity velocity, Offset offset) {
              print(offset.dx);
              if (offset.dx > 100) {
                matches.add(ItemPackage(cards.elementAt(x).title));
                _removeCard(x);
              }else if(offset.dx < -100){
                _removeCard(x);
              }
            },
            childWhenDragging: Container(),
            feedback: Card(
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                height: 400,
                width: 300,
              ),
            ),
            child: Card(
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                height: 400,
                width: 300,
                child: Text(
                  cards[x].title,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return cardList;
  }
}
