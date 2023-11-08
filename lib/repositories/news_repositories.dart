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
          'sources':
              'cnn, cnbc, the-washington-post, espn, reuters, the-wall-street-journal, al-jazeera-english, engadget',
          'pageSize': 10,
          'language': 'en',
          'sortBy': 'relevancy',
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
          'category': 'general',
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
