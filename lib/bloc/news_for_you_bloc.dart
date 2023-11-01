import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'news_for_you_event.dart';
part 'news_for_you_state.dart';

class NewsForYouBloc extends Bloc<NewsForYouEvent, NewsForYouState> {
  NewsForYouBloc() : super(NewsForYouInitial()) {
    on<NewsForYouEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
