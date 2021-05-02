import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_list/widgets/favourite_quotes.dart';
import 'package:quotes_list/widgets/quote_list.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text("Home"),
              onTap: () => Get.offAll(QuoteList()),
            ),
            ListTile(
              title: Text("Favourites"),
              onTap: () => Get.to(FavouriteQuotes()),
            ),
            ListTile(
              title: Text("About"),
              onTap: () => Get.defaultDialog(
                title: 'Quote Generator v.1.0',
                middleText: '@ksanthippos 2021',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
