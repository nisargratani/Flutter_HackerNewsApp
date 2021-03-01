import 'package:flutter_hackernewsapp/repositories/repository.dart';

class NewsService {
  Repository _repository;
  NewsService() {
    _repository = Repository();
  }
  Future<int> saveNews(Map<String, dynamic> news) async {
    return await _repository.insertData('news', news);
  }

  Future<List<Map<String, dynamic>>> readNews() async {
    return await _repository.readData('news');
  }

  Future<List<Map<String, dynamic>>> readNewsById(int newsId) async {
    return await _repository.readDataById('news', newsId);
  }
}
