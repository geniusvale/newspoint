import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newspoint/model/newsmodel.dart';
import 'package:newspoint/repositories/news_repositories.dart';

part 'news_for_you_event.dart';
part 'news_for_you_state.dart';

class NewsForYouBloc extends Bloc<NewsForYouEvent, NewsForYouState> {
  NewsForYouBloc() : super(NewsForYouInitial()) {
    on<FetchNewsForYou>(fetchNewsForYou);
  }

  final NewsRepository _newsRepository = NewsRepository();

  fetchNewsForYou(event, emit) async {
    emit(NewsForYouLoading());

    try {
      final data = await _newsRepository.fetchForYouNews();
      emit(NewsForYouLoaded(newsForYou: data));
    } catch (e) {
      emit(NewsForYouError(e.toString()));
    }
  }
}
