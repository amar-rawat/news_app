import 'package:flutter/material.dart';
import 'package:news_app/api/news_api.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  Future<List<NewsModel>> getNews() async {
    List<NewsModel> news = await NewsApi.hitApi();
    return news;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(title: 'News App'),
      ),
      body: FutureBuilder(
        future: getNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: (snapshot.data as List<NewsModel>).length,
              itemBuilder: (BuildContext context, int index) {
                return Text(snapshot.data!.length.toString());
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
