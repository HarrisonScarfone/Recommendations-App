import 'package:findstuff/todos/search_info.dart';
import 'package:flutter/material.dart';

class SearchSetupScreen extends StatelessWidget {
  final SearchInfo searchInfo;

  SearchSetupScreen({Key key, @required this.searchInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Text(this.searchInfo.searchingFor),
    );
  }
}
