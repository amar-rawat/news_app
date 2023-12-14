import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/news_api.dart';
import 'package:news_app/features/home_page/bloc/home_bloc.dart';
import 'package:news_app/features/home_page/bloc/home_event.dart';
import 'package:news_app/features/home_page/bloc/home_state.dart';
import 'package:news_app/features/home_page/models/news_model.dart';
import 'package:news_app/widgets/home_drawer.dart';
import 'package:news_app/widgets/home_appbar/ui/home_appbar.dart';
import 'package:news_app/widgets/news_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeBloc homeBloc = HomeBloc();

  Future<List<NewsModel>> getNews() async {
    List<NewsModel> news = await NewsApi.hitApi();
    List<NewsModel> validNews = [];
    for (NewsModel i in news) {
      if (i.imageUrl != null) {
        validNews.add(i);
      }
    }
    return validNews;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: HomeAppBar(title: 'News App'),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        // listenWhen: (previous, current) => current is InternetNotConnectedState,
        buildWhen: (previous, current) => current is! InternetNotConnectedState,
        listener: (context, state) {
          // Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Icon(
          //         Icons.warning_amber_rounded,
          //         size: 50,
          //       ),
          //       Text('No internet connection!'),
          //     ],
          //   ),
          // );
        },
        builder: (context, state) {
          if (state is HomeInitialState) {
            homeBloc.add(HomeLoadingEvent());
            return Text('Initial state');
          } else if (state is InternetNotConnectedState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    size: 50,
                  ),
                  Text('No internet connection!'),
                ],
              ),
            );
          } else if (state is HomeLoadingState) {
            homeBloc.add(HomeLoadedEvent());
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoadedState) {
            return Scrollbar(
              radius: Radius.circular(5),
              thickness: 10,
              trackVisibility: true,
              child: FutureBuilder(
                future: getNews(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                        itemCount: (snapshot.data as List<NewsModel>).length,
                        itemBuilder: (BuildContext context, int index) {
                          if (snapshot.data![index].body == null) {
                            return NewsCard(
                                imageUrl:
                                    snapshot.data![index].imageUrl.toString(),
                                title: snapshot.data![index].title,
                                body: 'No description available',
                                source: snapshot.data![index].source);
                          } else {
                            return NewsCard(
                              imageUrl:
                                  snapshot.data![index].imageUrl.toString(),
                              title: snapshot.data![index].title,
                              body: snapshot.data![index].body.toString(),
                              source: snapshot.data![index].source,
                            );
                          }
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            );
          } else {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.warning_amber_rounded, size: 50),
                  Text('Something went wrong!'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
