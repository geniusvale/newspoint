import 'package:dio/dio.dart';
import 'package:newspoint/model/newsmodel.dart';
import 'package:newspoint/services/api.dart';

class NewsRepository {
  //INSTANCE OF API
  final API _api = API();

  Future<NewsModel> fetchAllNews() async {
    try {
      final response = await _api.dio.get(
        '/everything',
        queryParameters: {
          //REQUIRED ATLEAST ONE QUERY PARAM
          'sources': 'google-news',
          // 'pageSize': 5,
          'language': 'en',
        },
      );

      NewsModel news = NewsModel.fromJson(response.data);

      return news;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<NewsModel> fetchForYouNews() async {
    try {
      final Response response = await _api.dio.get(
        '/top-headlines',
        queryParameters: {
          //REQUIRED ATLEAST ONE QUERY PARAM
          'country': 'id',
          // 'pageSize': 5,
        },
      );

      NewsModel news = NewsModel.fromJson(response.data);

      print(news.articles!.length);
      return news;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
