import 'dart:ui';

import 'package:findstuff/screens/card_screen.dart';
import 'package:findstuff/todos/pass_to_cards_screen.dart';
import 'package:findstuff/todos/pass_to_search_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:findstuff/utilities/default_keywords.dart';

class SearchSetupScreen extends StatefulWidget {
  static const routeName = '/search_setup_screen';

  PassToSearchSetup passToSearchSetup;

  SearchSetupScreen({Key key, @required this.passToSearchSetup})
      : super(key: key);

  @override
  _SearchSetupScreenState createState() => _SearchSetupScreenState();
}

class _SearchSetupScreenState extends State<SearchSetupScreen> {
  final lowerPriceController = TextEditingController();
  final upperPriceController = TextEditingController();

  String _age = '18';

  TextEditingController _ageController;
  TextEditingController _lowPriceController;
  TextEditingController _highPriceController;
  TextEditingController _userKeywordController;

  Color defaultColor = Color.fromRGBO(100, 100, 100, 1);
  Color pressedColor = Color.fromRGBO(50,25,100, 0.8);

  Color color0;
  Color color1;
  Color color2;
  Color color3;
  Color color4;
  Color color5;
  Color color6;
  Color color7;
  Color color8;
  Color color9;
  Color color10;
  Color color11;

  List<String> _searchStringsToPass = List<String>();
  List<String> phantom_list = List<String>();

  @override
  void initState() {
    super.initState();
    _ageController = new TextEditingController(text: '18');
    _lowPriceController = new TextEditingController(text: '0');
    _highPriceController = new TextEditingController(text: '100');
    _userKeywordController = new TextEditingController();
    color0 = defaultColor;
    color1 = defaultColor;
    color2 = defaultColor;
    color3 = defaultColor;
    color4 = defaultColor;
    color5 = defaultColor;
    color6 = defaultColor;
    color7 = defaultColor;
    color8 = defaultColor;
    color9 = defaultColor;
    color10 = defaultColor;
    color11 = defaultColor;
  }

  List<String> parseKeywords(String string){
    return string.split(new RegExp(r"\s+"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Narrow the Search'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
            )
          ],
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Finding Gifts For a ' + widget.passToSearchSetup.who + '...',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(100, 10, 100, 5),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Age of ' + widget.passToSearchSetup.who),
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(45, 10, 45, 10),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new TextField(
                          controller: _lowPriceController,
                          decoration: new InputDecoration(labelText: "Price Min"),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(45, 10, 45, 10),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new TextField(
                          controller: _highPriceController,
                          decoration: new InputDecoration(
                            labelText: "Max Price",
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Column(
              children: <Widget>[
                Text(
                  'Pick Some Keywords',
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        if(!_searchStringsToPass.contains(widget.passToSearchSetup.keywords.elementAt(0))){
                          _searchStringsToPass.add(widget.passToSearchSetup.keywords.elementAt(0));
                          setState(() {
                            color0 = pressedColor;
                          });
                        }else{
                          _searchStringsToPass.remove(widget.passToSearchSetup.keywords.elementAt(0));
                          setState(() {
                            color0 = defaultColor;
                          });
                        }
                      },
                      child: Card(
                        color: color0,
                        child: Text(
                            widget.passToSearchSetup.keywords.elementAt(0),
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if(!_searchStringsToPass.contains(widget.passToSearchSetup.keywords.elementAt(1))){
                          _searchStringsToPass.add(widget.passToSearchSetup.keywords.elementAt(1));
                          setState(() {
                            color1 = pressedColor;
                          });
                        }else{
                          _searchStringsToPass.remove(widget.passToSearchSetup.keywords.elementAt(1));
                          setState(() {
                            color1 = defaultColor;
                          });
                        }
                      },
                      child: Card(
                        color: color1,
                        child: Text(
                          widget.passToSearchSetup.keywords.elementAt(1),
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if(!_searchStringsToPass.contains(widget.passToSearchSetup.keywords.elementAt(2))){
                          _searchStringsToPass.add(widget.passToSearchSetup.keywords.elementAt(2));
                          setState(() {
                            color2 = pressedColor;
                          });
                        }else{
                          _searchStringsToPass.remove(widget.passToSearchSetup.keywords.elementAt(2));
                          setState(() {
                            color2 = defaultColor;
                          });
                        }
                      },
                      child: Card(
                        color: color2,
                        child: Text(
                          widget.passToSearchSetup.keywords.elementAt(2),
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if(!_searchStringsToPass.contains(widget.passToSearchSetup.keywords.elementAt(3))){
                          _searchStringsToPass.add(widget.passToSearchSetup.keywords.elementAt(3));
                          setState(() {
                            color3 = pressedColor;
                          });
                        }else{
                          _searchStringsToPass.remove(widget.passToSearchSetup.keywords.elementAt(3));
                          setState(() {
                            color3 = defaultColor;
                          });
                        }
                      },
                      child: Card(
                        color: color3,
                        child: Text(
                          widget.passToSearchSetup.keywords.elementAt(3),
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        if(!_searchStringsToPass.contains(widget.passToSearchSetup.keywords.elementAt(4))){
                          _searchStringsToPass.add(widget.passToSearchSetup.keywords.elementAt(4));
                          setState(() {
                            color4 = pressedColor;
                          });
                        }else{
                          _searchStringsToPass.remove(widget.passToSearchSetup.keywords.elementAt(4));
                          setState(() {
                            color4 = defaultColor;
                          });
                        }
                      },
                      child: Card(
                        color: color4,
                        child: Text(
                          widget.passToSearchSetup.keywords.elementAt(4),
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if(!_searchStringsToPass.contains(widget.passToSearchSetup.keywords.elementAt(5))){
                          _searchStringsToPass.add(widget.passToSearchSetup.keywords.elementAt(5));
                          setState(() {
                            color5 = pressedColor;
                          });
                        }else{
                          _searchStringsToPass.remove(widget.passToSearchSetup.keywords.elementAt(5));
                          setState(() {
                            color5 = defaultColor;
                          });
                        }
                      },
                      child: Card(
                        color: color5,
                        child: Text(
                          widget.passToSearchSetup.keywords.elementAt(5),
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if(!_searchStringsToPass.contains(widget.passToSearchSetup.keywords.elementAt(6))){
                          _searchStringsToPass.add(widget.passToSearchSetup.keywords.elementAt(6));
                          setState(() {
                            color6 = pressedColor;
                          });
                        }else{
                          _searchStringsToPass.remove(widget.passToSearchSetup.keywords.elementAt(6));
                          setState(() {
                            color6 = defaultColor;
                          });
                        }
                      },
                      child: Card(
                        color: color6,
                        child: Text(
                          widget.passToSearchSetup.keywords.elementAt(6),
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if(!_searchStringsToPass.contains(widget.passToSearchSetup.keywords.elementAt(7))){
                          _searchStringsToPass.add(widget.passToSearchSetup.keywords.elementAt(7));
                          setState(() {
                            color7 = pressedColor;
                          });
                        }else{
                          _searchStringsToPass.remove(widget.passToSearchSetup.keywords.elementAt(7));
                          setState(() {
                            color7 = defaultColor;
                          });
                        }
                      },
                      child: Card(
                        color: color7,
                        child: Text(
                          widget.passToSearchSetup.keywords.elementAt(7),
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        if(!_searchStringsToPass.contains(widget.passToSearchSetup.keywords.elementAt(8))){
                          _searchStringsToPass.add(widget.passToSearchSetup.keywords.elementAt(8));
                          setState(() {
                            color8 = pressedColor;
                          });
                        }else{
                          _searchStringsToPass.remove(widget.passToSearchSetup.keywords.elementAt(8));
                          setState(() {
                            color8 = defaultColor;
                          });
                        }
                      },
                      child: Card(
                        color: color8,
                        child: Text(
                          widget.passToSearchSetup.keywords.elementAt(8),
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if(!_searchStringsToPass.contains(widget.passToSearchSetup.keywords.elementAt(9))){
                          _searchStringsToPass.add(widget.passToSearchSetup.keywords.elementAt(9));
                          setState(() {
                            color9 = pressedColor;
                          });
                        }else{
                          _searchStringsToPass.remove(widget.passToSearchSetup.keywords.elementAt(9));
                          setState(() {
                            color9 = defaultColor;
                          });
                        }
                      },
                      child: Card(
                        color: color9,
                        child: Text(
                          widget.passToSearchSetup.keywords.elementAt(9),
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if(!_searchStringsToPass.contains(widget.passToSearchSetup.keywords.elementAt(10))){
                          _searchStringsToPass.add(widget.passToSearchSetup.keywords.elementAt(10));
                          setState(() {
                            color10 = pressedColor;
                          });
                        }else{
                          _searchStringsToPass.remove(widget.passToSearchSetup.keywords.elementAt(10));
                          setState(() {
                            color10 = defaultColor;
                          });
                        }
                      },
                      child: Card(
                        color: color10,
                        child: Text(
                          widget.passToSearchSetup.keywords.elementAt(10),
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if(!_searchStringsToPass.contains(widget.passToSearchSetup.keywords.elementAt(11))){
                          _searchStringsToPass.add(widget.passToSearchSetup.keywords.elementAt(11));
                          setState(() {
                            color11 = pressedColor;
                          });
                        }else{
                          _searchStringsToPass.remove(widget.passToSearchSetup.keywords.elementAt(11));
                          setState(() {
                            color11 = defaultColor;
                          });
                        }
                      },
                      child: Card(
                        color: color11,
                        child: Text(
                          widget.passToSearchSetup.keywords.elementAt(11),
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 5),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('...Or Enter Your Own (seperated by a space)'),
                  new TextField(
                    controller: _userKeywordController,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: new MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        elevation: 5.0,
                        minWidth: 300.0,
                        height: 75,
                        color: Colors.blue,
                        child: new Text(
                          'Start Swiping',
                          style:
                              new TextStyle(fontSize: 30.0, color: Colors.white),
                        ),
                        onPressed: () {
                          widget.passToSearchSetup.keywords = DefaultKeywords
                              .keywords[widget.passToSearchSetup.who]
                              .map((element) => element)
                              .toList();
                          phantom_list.addAll(parseKeywords(_userKeywordController.text));
                          for(int i = 0; i < phantom_list.length; i++){
                           if(!_searchStringsToPass.contains(phantom_list.elementAt(i))){
                             _searchStringsToPass.add(phantom_list.elementAt(i));
                           }
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CardScreen(
                                searchPackage: new SearchPackage(
                                  widget.passToSearchSetup.who,
                                  int.parse(_ageController.text),
                                  int.parse(_lowPriceController.text),
                                  int.parse(_highPriceController.text),
                                  this._searchStringsToPass,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
