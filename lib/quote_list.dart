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
        text: Quotes.getRandom().getContent()
      ));
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
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent[100],
      ),
      body: ListView(
        children: quotes.map((quote) => QuoteCard(
            quote: quote,
            delete: () {
              setState(() {
                quotes.remove(quote);
              });
            }
        )).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            quotes = [];
            getQuotes();
          });
        },
        child: Icon(Icons.refresh,),
        backgroundColor: Colors.redAccent[100],
      ),
    );
  }
}