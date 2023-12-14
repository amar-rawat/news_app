import 'package:flutter/material.dart';
import 'package:news_app/themes/text_theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TitleText(title: 'About us'),
            BodyText(
                body:
                    'This is a news app developed with flutter which shows the latest international news.'),
            TitleText(title: 'Developer Info'),
            BodyText(body: 'Name : Amar Rawat\nEmail : amarrawat244@gmail.com')
          ],
        ),
      ),
    );
  }
}
