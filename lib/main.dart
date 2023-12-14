import 'package:flutter/material.dart';
import 'package:news_app/features/about_page/ui/about_page.dart';
import 'package:news_app/features/home_page/bloc/home_bloc.dart';
import 'package:news_app/features/home_page/ui/home_page.dart';
import 'package:news_app/features/news_detail_page/ui/news_detail_page.dart';
import 'package:news_app/themes/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => HomeBloc(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Apptheme().apptheme(),
      title: 'News App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}
