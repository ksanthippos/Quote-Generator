import 'package:flutter/cupertino.dart';
import 'package:quotes/quotes.dart';
import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [];

  void getQuotes() {
    for (int i = 0; i < 5; i++) {
      quotes.add(Quote(
          author: Quotes.getRandom().getAuthor(),
          text: Quotes.getRandom().getContent()));
    }
  }

  @override
  void initState() {
    super.initState();
    getQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      appBar: AppBar(
        title: Text("Awesome quotes!"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              ListView(
                children: quotes
                    .map((quote) => QuoteCard(
                          quote: quote,
                          delete: () {
                            setState(() {
                              quotes.remove(quote);
                            });
                          },
                          addFavourite: () {
                            setState(() {
                              Navigator.pushNamed(context, '/favourites',
                                  arguments: {
                                    'quote': quote,
                                  });
                            });
                          },
                        ))
                    .toList(),
              ),
              Positioned(
                  left: 20,
                  right: 20,
                  bottom: 20,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(right: 20),
                            child: FloatingActionButton(
                              heroTag: 'refresh',
                              onPressed: () {
                                setState(() {
                                  quotes = [];
                                  getQuotes();
                                });
                              },
                              child: Icon(Icons.refresh),
                            )),
                        Container(
                            margin: EdgeInsets.only(right: 10),
                            child: FloatingActionButton(
                              heroTag: 'favourite',
                              onPressed: () {
                                Navigator.pushNamed(context, '/favourites');
                              },
                              backgroundColor: Colors.deepPurpleAccent,
                              child: Icon(Icons.star),
                            )),
                      ],
                    ),
                  )),
            ],
          )),
    );
  }
}
