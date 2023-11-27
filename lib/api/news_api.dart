import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';

class NewsApi {
  static hitApi() async {
    const url =
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=c44d5e33ba0147c59ba9d532fbe1b08d';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    var jsonData = jsonDecode(response.body);

    List<NewsModel> newsList = [];

    for (var eachNews in jsonData['articles']) {
      final news = NewsModel(
          imageUrl: eachNews['url'],
          title: eachNews['title'],
          body: eachNews['title']);

      newsList.add(news);
    }
    return NewsModel.getNewsFromSnapshot(newsList);
  }
}
