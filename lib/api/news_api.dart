import 'dart:convert';

import 'package:http/http.dart' as http;

class NewsApi {
  static getItem() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=c44d5e33ba0147c59ba9d532fbe1b08d'));
    Map data = jsonDecode(response.body);

    List doneDataList = [];
    for (var i in data['articles']) {
      doneDataList.add(i['title']);
      print(doneDataList);
    }
  }
}
