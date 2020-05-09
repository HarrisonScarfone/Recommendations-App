import 'package:findstuff/screens/search_setup_screen.dart';
import 'package:findstuff/todos/searching_for_who.dart';
import 'package:flutter/material.dart';

class RecommendForButton extends StatelessWidget {
  final String category;
  final String image;
  final double topPadding;
  final double textImagePadding;
  final double height;
  final double width;

  const RecommendForButton(this.category, this.image, this.topPadding,
      this.textImagePadding, this.height, this.width);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchSetupScreen(
              searchingForWho: SearchingForWho(this.category),
            ),
          ),
        );
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: this.topPadding),
            ),
            Text(
              this.category,
              style: TextStyle(fontSize: 25),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: this.textImagePadding),
            ),
            Container(
              child: Image(
                image: AssetImage(this.image),
                height: this.height,
                width: this.width,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
