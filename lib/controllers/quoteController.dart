import 'package:get/get.dart';
import 'package:quotes_list/models/quote.dart';
import 'package:quotes/quotes.dart';

class QuoteController extends GetxController {
  static QuoteController get to => Get.find<QuoteController>();
  final quotes = [].obs;
  final favouriteQuotes = [].obs;

  // init
  QuoteController() {
    for (int i = 0; i < 5; i++) {
      quotes.add(Quote(
          author: Quotes.getRandom().getAuthor(),
          text: Quotes.getRandom().getContent()));
    }
  }

  resetQuotes() {
    quotes.clear();
    for (int i = 0; i < 5; i++) {
      quotes.add(Quote(
          author: Quotes.getRandom().getAuthor(),
          text: Quotes.getRandom().getContent()));
    }
  }

  removeQuote(Quote quote) {
    quotes.remove(quote);
  }

  addFavourite(Quote quote) {
    favouriteQuotes.contains(quote) ? null : favouriteQuotes.add(quote);
  }

  removeFavourite(Quote quote) {
    favouriteQuotes.remove(quote);
  }
}
