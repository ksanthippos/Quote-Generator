import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_list/controllers/quoteController.dart';
import 'widgets/quote_list.dart';

void main() {
  Get.put(QuoteController());
  runApp(GetMaterialApp(
    home: QuoteList(),
  ));
}
