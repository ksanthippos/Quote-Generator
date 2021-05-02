import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_list/controllers/quoteController.dart';
import 'package:quotes_list/models/quote.dart';
import 'package:quotes_list/widgets/quote_card.dart';

class FavouriteQuotes extends StatelessWidget {
  final quoteController = QuoteController.to;
  final bgColor = Colors.blueAccent[100];
  final appBarColor = Colors.blueAccent[400];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('My Favourite Quotes'),
        centerTitle: true,
        backgroundColor: appBarColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: quoteController.favouriteQuotes.length,
                itemBuilder: (context, index) {
                  Quote quote = quoteController.favouriteQuotes[index];
                  return QuoteCard(
                    quote: quote,
                    delete: () => quoteController.removeFavourite(quote),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
