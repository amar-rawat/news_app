class NewsItem {
  final String imageUrl;
  final String title;
  final String body;

  NewsItem({required this.imageUrl, required this.title, required this.body});

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
        imageUrl: json['imageUrl'] as String,
        title: json['title'] as String,
        body: json['body'] as String);
  }

  static List<NewsItem> newsItemFromSnapshot(List snapshot) {
    return snapshot.map((e) => NewsItem.fromJson(e)).toList();
  }
}
