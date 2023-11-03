import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newspoint/model/articlemodel.dart';
import 'package:newspoint/repositories/news_repositories.dart';

part 'news_today_event.dart';
part 'news_today_state.dart';

class NewsTodayBloc extends Bloc<NewsTodayEvent, NewsTodayState> {
  NewsTodayBloc() : super(NewsTodayInitial()) {
    on<FetchNewsToday>(fetchNewsToday);
  }

  final NewsRepository _newsRepo = NewsRepository();

  void fetchNewsToday(event, emit) async {
    emit(NewsTodayLoading());

    try {
      final data = await _newsRepo.fetchAllNews();
      emit(NewsTodayLoaded(newsToday: data));
    } catch (e) {
      emit(NewsTodayError(message: e.toString()));
    }
  }
}
