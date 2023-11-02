import 'package:dio/dio.dart';

class API {
  final Dio dio;

  //PRIVATE CONSTRUCTOR
  API._internal(this.dio);

  // final String apiKey = 'd8d9bba38a4e4d5ca6950f8a168f2454';

  //THE ONE AND ONLY INSTANCE OF THIS SINGLETON
  static final API _api = API._internal(
    Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/v2',
        headers: {
          'Authorization': 'd8d9bba38a4e4d5ca6950f8a168f2454',
        },
      ),
    ),
  );

  //FACTORY CONSTRUCTOR
  factory API() => _api;
}
