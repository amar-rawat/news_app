class NewsModel {
  final String? imageUrl;
  final String title;
  final String? body;
  final String source;

  NewsModel(
      {required this.source,
      required this.imageUrl,
      required this.title,
      required this.body});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        imageUrl: json['urlToImage'],
        title: json['title'] as String,
        body: json['content'],
        source: json['source']['name'] as String);
  }

  static List<NewsModel> getNewsFromSnapshot(List newsKiList) {
    return newsKiList.map((e) => NewsModel.fromJson(e)).toList();
  }
}
