import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quote_list.dart';
import 'favourite_quotes.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => QuoteList(),
    '/favourites': (context) => FavouriteQuotes(),
  }
));


