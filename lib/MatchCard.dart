class MatchCard {
  String name;
  String available;
  String img;
  double price;
  int people;
  double marginTop = 0;

  MatchCard(String name, String available, String img, double price, int people,
      double marginTop) {
    this.name = name;
    this.available = available;
    this.img = img;
    this.price = price;
    this.people = people;
    this.marginTop = marginTop;
  }
}
