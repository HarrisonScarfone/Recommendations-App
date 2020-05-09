import 'package:findstuff/screens/card_screen.dart';
import 'package:findstuff/todos/search_package.dart';
import 'package:findstuff/todos/searching_for_who.dart';
import 'package:findstuff/widgets/keyword_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchSetupScreen extends StatefulWidget {
  static const routeName = '/search_setup_screen';

  final SearchingForWho searchingForWho;

  SearchSetupScreen({Key key, @required this.searchingForWho})
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

  List<String> _keywords = ['bob'];

  @override
  void initState() {
    super.initState();
    _ageController = new TextEditingController(text: '18');
    _lowPriceController = new TextEditingController(text: '0');
    _highPriceController = new TextEditingController(text: '100');
    _userKeywordController = new TextEditingController();
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  ' Searching for a ' + widget.searchingForWho.who + '...',
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
                Text('Age of ' + widget.searchingForWho.who),
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
                  KeywordButton('aasdvasdv'),
                  KeywordButton('basdv'),
                  KeywordButton('aasd'),
                  KeywordButton('basdvasdvasdv'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  KeywordButton('aasdvasdv'),
                  KeywordButton('basdv'),
                  KeywordButton('aasd'),
                  KeywordButton('basdvasdvasdv'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  KeywordButton('aasdvasdv'),
                  KeywordButton('basdv'),
                  KeywordButton('aasd'),
                  KeywordButton('basdvasdvasdv'),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(100, 10, 100, 5),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('...Or Enter Your Own'),
                new TextField(
                  controller: _userKeywordController,
                  keyboardType: TextInputType.number,
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
                        print(this._ageController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CardScreen(
                              searchPackage: new SearchPackage(
                                widget.searchingForWho.who,
                                int.parse(_ageController.text),
                                int.parse(_lowPriceController.text),
                                int.parse(_highPriceController.text),
                                this._keywords,
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
    );
  }
}
