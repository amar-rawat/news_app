import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'news_detail_event.dart';
part 'news_detail_state.dart';

class NewsDetailBloc extends Bloc<NewsDetailEvent, NewsDetailState> {
  NewsDetailBloc() : super(NewsDetailInitial()) {
    on<NewsDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
