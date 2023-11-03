import 'package:dio/dio.dart';
import 'package:newspoint/model/articlemodel.dart';
import 'package:newspoint/services/api.dart';

class NewsRepository {
  //INSTANCE OF API
  final API _api = API();

  Future<List<ArticleModel>> fetchAllNews() async {
    try {
      final response = await _api.dio.get(
        '/everything',
        queryParameters: {
          //REQUIRED ATLEAST ONE QUERY PARAM
          'sources': 'google-news',
          'pageSize': 5,
          'language': 'en',
        },
      );

      List<ArticleModel> articles = (response.data['articles'] as List)
          .map((e) => ArticleModel.fromJson(e))
          .toList();

      return articles;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future fetchForYouNews() async {
    try {
      final Response response = await _api.dio.get(
        '/top-headlines',
        queryParameters: {
          //REQUIRED ATLEAST ONE QUERY PARAM
          'country': 'id',
          'pageSize': 5,
        },
      );

      List<ArticleModel> articles = (response.data['articles'] as List)
          .map((e) => ArticleModel.fromJson(e))
          .toList();

      print(response.data);
      return articles;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
