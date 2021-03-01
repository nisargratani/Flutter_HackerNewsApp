import 'package:dio/dio.dart';

class NetworkHelper {
  var dio = Dio();
  Future<dynamic> getData(int newsId) async {
    Response<dynamic> response = await dio.get(
        'https://hacker-news.firebaseio.com/v0/item/$newsId.json?print=pretty');
    return response.data;
  }

  Future<dynamic> getIds() async {
    Response response = await dio.get(
        'https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty');
    return response.data;
  }
}
