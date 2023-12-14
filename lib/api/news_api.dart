import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/features/home_page/models/news_model.dart';

class NewsApi {
  static hitApi() async {
    var url =
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=c44d5e33ba0147c59ba9d532fbe1b08d';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    var jsonData = jsonDecode(response.body);

    List<Map> newsList = [];

    for (var eachNews in jsonData['articles']) {
      newsList.add(eachNews);
    }
    return NewsModel.getNewsFromSnapshot(newsList);
  }
}
