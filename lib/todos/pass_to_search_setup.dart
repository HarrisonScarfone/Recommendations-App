class PassToSearchSetup {

  String who;
  List<String> keywords;

  PassToSearchSetup(who, keywords){
    this.who = who;
    this.keywords = keywords;
    this.keywords.shuffle();
  }

}