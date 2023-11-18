import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        decoration: TextDecoration.underline,
        fontSize: 18,
        color: Colors.black,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}

class BodyText extends StatelessWidget {
  const BodyText({super.key, required this.body});
  final String body;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Text(
        body,
        maxLines: 8,
        style: TextStyle(
            fontSize: 14, overflow: TextOverflow.ellipsis, height: 1.2),
      ),
    );
  }
}

class ReadMoreText extends StatelessWidget {
  const ReadMoreText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Read More',
        style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
            fontSize: 14));
  }
}
