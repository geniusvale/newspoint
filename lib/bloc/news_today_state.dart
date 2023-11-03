part of 'news_today_bloc.dart';

sealed class NewsTodayState {}

final class NewsTodayInitial extends NewsTodayState {}

final class NewsTodayLoading extends NewsTodayState {}

final class NewsTodayError extends NewsTodayState {
  String? message;
  NewsTodayError({this.message});
}

final class NewsTodayLoaded extends NewsTodayState {
  List<ArticleModel> newsToday;

  NewsTodayLoaded({required this.newsToday});
}
