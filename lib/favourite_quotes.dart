import 'package:flutter/cupertino.dart';
import 'package:quotes/quotes.dart';
import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';
import 'quote_card.dart';

class FavouriteQuotes extends StatefulWidget {
  @override
  _FavouriteQuotesState createState() => _FavouriteQuotesState();
}

class _FavouriteQuotesState extends State<FavouriteQuotes> {

  List<Quote> favourites = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[100],
      appBar: AppBar(
        title: Text('My favourite quotes'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent[400],
      ),
      body: ListView(
        children: favourites.map((quote) => QuoteCard(
        quote: quote,
        delete: () {
          setState(() {
          favourites.remove(quote);
        });
        },
        addFavourite: () {
          setState(() {
            if (!favourites.contains(quote)) {
              favourites.add(quote);
            }
          });
        },
        )).toList(),
      ),
    );
  }
}
