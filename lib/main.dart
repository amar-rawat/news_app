import 'package:flutter/material.dart';
import 'package:news_app/api/news_api.dart';
import 'package:news_app/features/home_page/ui/home_page.dart';
import 'package:news_app/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Apptheme().apptheme(),
      title: 'News App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
