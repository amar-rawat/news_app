import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';

import 'package:news_app/themes/app_colors.dart';
import 'package:news_app/themes/text_theme.dart';

class NewsCard extends StatelessWidget {
  NewsCard({super.key, required this.snapshot});
  AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    child: Image.network('')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TitleText(
                  title: snapshot.data['title'],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BodyText(body: snapshot.data['title']),
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
    );
  }
}
