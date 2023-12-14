import 'package:flutter/material.dart';
import 'package:news_app/features/news_detail_page/ui/news_detail_page.dart';
import 'package:news_app/themes/app_colors.dart';
import 'package:news_app/themes/text_theme.dart';

class NewsCard extends StatelessWidget {
  NewsCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.body,
      required this.source});

  final String imageUrl;
  final String title;
  final String body;
  final String source;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  NewsDetailPage(body: body, imageUrl: imageUrl, title: title),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(color: AppColors.cardColor),
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        imageUrl,
                        height: MediaQuery.of(context).size.height * 0.23,
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                      )),
                ),
                Text('Source : $source'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TitleText(
                    title: title,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BodyText(body: body),
                  ),
                ),
                ReadMoreText(),
                SizedBox(
                  height: 12,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
