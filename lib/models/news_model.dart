class NewsModel {
  final String imageUrl;
  final String title;
  final String body;

  NewsModel({required this.imageUrl, required this.title, required this.body});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        imageUrl: json['url'] as String,
        title: json['title'] as String,
        body: json['title'] as String);
  }

  static List<NewsModel> getNewsFromSnapshot(List newsKiList) {
    return newsKiList.map((e) => NewsModel.fromJson(e)).toList();
  }
}
