import 'package:findstuff/todos/pass_to_cards_screen.dart';
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

  void goToPickMatchScreen() {
//    Navigator.push(
//      context,
//      MaterialPageRoute(
//        builder: (context) => CardScreen(
//          searchPackage: new SearchPackage(
//          ),
//        ),
//      ),
//    );
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
            padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    print('test');
                  },
                  child: Text(
                    'No',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    print('Yes');
                  },
                  child: Text(
                    'Yes',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 25),
            child: RaisedButton(
              onPressed: () {
                print('see matches');
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
            onDragEnd: (drag) {
              _removeCard(x);
            },
            childWhenDragging: Container(),
            feedback: Card(
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                height: 500,
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
                height: 300,
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
