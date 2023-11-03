part of 'news_for_you_bloc.dart';

sealed class NewsForYouState {}

final class NewsForYouInitial extends NewsForYouState {}

final class NewsForYouLoading extends NewsForYouState {}

final class NewsForYouLoaded extends NewsForYouState {
  NewsForYouLoaded({required this.newsForYou});

  NewsModel newsForYou;
}

final class NewsForYouError extends NewsForYouState {
  NewsForYouError(this.message);

  String? message;
}
