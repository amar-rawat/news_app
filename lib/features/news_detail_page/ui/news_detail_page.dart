import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.body});
  final String imageUrl;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Image.network(imageUrl.toString()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 18, decoration: TextDecoration.underline),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                body,
                style: TextStyle(fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
