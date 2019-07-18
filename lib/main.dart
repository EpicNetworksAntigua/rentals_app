import 'package:flutter/material.dart';

import 'MatchCard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: _getBackgroundColor(),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Icons.navigate_before,
                color: _getTextColor(),
              ),
              Text('Explore', style: TextStyle(color: _getTextColor())),
              Icon(Icons.search),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: CardListStateWidget(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    width: 70,
                    height: 70,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.not_interested,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.done,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    width: 70,
                    height: 70,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.bookmark,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Color _getBackgroundColor() {
    return Color.fromARGB(255, 29, 39, 64);
  }

  Color _getTextColor() {
    return Color.fromARGB(255, 248, 249, 253);
  }
}

class CardListStateWidget extends StatefulWidget {
  @override
  _CardListStateWidgetState createState() => _CardListStateWidgetState();
}

class _CardListStateWidgetState extends State<CardListStateWidget> {
  List<Widget> cardList = List();
  List<MatchCard> cards = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cards.add(MatchCard(
        'Honda Stepwagon',
        'Currently available',
        'https://m.honda.com.my/graphic/gallery/thumbnail/img_odyssey2.jpg',
        120,
        4,
        10));

    cards.add(MatchCard(
        'Toyota Camry',
        'Currently available',
        'https://m.honda.com.my/graphic/gallery/thumbnail/img_odyssey2.jpg',
        160,
        6,
        20));

    cards.add(MatchCard(
        'Honda Odyssey',
        'Currently available',
        'https://m.honda.com.my/graphic/gallery/thumbnail/img_odyssey2.jpg',
        360,
        2,
        30));
  }

  @override
  Widget build(BuildContext context) {
    cards.forEach((cardw) {
      cardList.add(
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: 100, minWidth: 100),
          child: Container(
            child: Draggable(
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 231, 234, 238),
                          spreadRadius: 2,
                          blurRadius: 5)
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              cardw.name,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45),
                            ),
                            Text(
                              cardw.available,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.redAccent,
                                  fontSize: 25),
                            ),
                          ],
                        ),
                        Image.network(cardw.img, fit: BoxFit.contain),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  "\$${cardw.price}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  color: Colors.redAccent),
                                ),
                                Text("/day", style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black45)
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.person),
                                Text("${cardw.people}")
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              feedback: Container(),
            ),
          ),
        ),
      );
    });
    return Stack(
      children: cardList,
    );
  }
}
