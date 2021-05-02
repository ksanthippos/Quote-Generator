import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:quotes_list/controllers/quoteController.dart';
import 'package:quotes_list/models/quote.dart';
import 'package:quotes_list/widgets/quote_card.dart';
import 'package:quotes_list/widgets/side_drawer.dart';

class QuoteList extends StatelessWidget {
  final quoteController = QuoteController.to;
  final bgColor = Colors.blueAccent[100];
  final appBarColor = Colors.blueAccent[400];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text("Quote Generator"),
        centerTitle: true,
        backgroundColor: appBarColor,
      ),
      body: Column(
        children: [
          Obx(
            () => ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: quoteController.quotes.length,
              itemBuilder: (context, index) {
                Quote quote = quoteController.quotes[index];
                return QuoteCard(
                  quote: quote,
                  delete: () => quoteController.removeQuote(quote),
                  addFavourite: () => quoteController.addFavourite(quote),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          quoteController.resetQuotes();
        },
        child: Icon(Icons.refresh),
        backgroundColor: appBarColor,
      ),
    );
  }
}
