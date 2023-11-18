import 'package:flutter/material.dart';
import 'package:news_app/api/news_api.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  Future<List<NewsItem>> getNewsItems() async {
    List<NewsItem> items = await NewsApi.getItem();
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: CustomAppBar(title: 'News App'),
        ),
        body: Text('data'));
  }
}
