import 'package:flutter/material.dart';
import '../models/quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final Function delete;
  final Function addFavourite;
  final bool favPageActive;
  QuoteCard(
      {this.quote, this.delete, this.addFavourite, this.favPageActive = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              quote.text,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 6),
            Text(
              quote.author,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                !favPageActive // card on home page --> show favourite button / card on fav page --> show delete
                    ? TextButton.icon(
                        icon: Icon(Icons.star),
                        label: Text('favourite'),
                        style: TextButton.styleFrom(
                          primary: Colors.grey[600],
                        ),
                        onPressed: addFavourite,
                      )
                    : TextButton.icon(
                        icon: Icon(Icons.delete),
                        label: Text('delete'),
                        style: TextButton.styleFrom(
                          primary: Colors.grey[600],
                        ),
                        onPressed: delete,
                      )
              ],
            )
          ],
        ),
      ),
    );
  }
}
