import 'package:flutter_hackernewsapp/models/news.dart';
import 'package:flutter_hackernewsapp/repositories/repository.dart';

class NewsService {
  Repository _repository;
  NewsService() {
    _repository = Repository();
  }
  saveNews(News news) async {
    return await _repository.insertData('news', news.toJson());
  }

  readNews() async {
    return await _repository.readData('news');
  }

  readNewsById(newsId) async {
    return await _repository.readDataById('news', newsId);
  }
}
