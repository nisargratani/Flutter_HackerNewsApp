import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hackernewsapp/models/news.dart';
import 'package:flutter_hackernewsapp/services/network.dart';
import 'package:flutter_hackernewsapp/services/news_service.dart';

class NewsList extends ChangeNotifier {
  List<News> newsList = <News>[];
  List<int> topIds = <int>[];
  List<Map<String, dynamic>> allData = <Map<String, dynamic>>[];
  int index = 0;

  Future<void> getFromTable() async {
    allData = await NewsService().readNews();
  }

  Future<void> getTopIds() async {
    final dynamic allIds = await NetworkHelper().getIds();
    if (allIds != null) {
      for (dynamic x in allIds) {
        topIds.add(x as int);
      }
    }
    notifyListeners();
  }

  Future<News> getNewsById(int id) async {
    dynamic news = await NetworkHelper().getData(id);
    if (news != null) {
      return News.fromJson(news as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  Future<void> getNextNews() async {
    List<News> newList = <News>[];
    if (topIds.isEmpty) {
      await getTopIds();
    }
    if (topIds.isNotEmpty) {
      for (int i = 0; i < 10 && index < 500; i++) {
        List<Map<String, dynamic>> data =
            await NewsService().readNewsById(topIds[index]);
        if (data.isNotEmpty) {
          newList.add(News.fromJson(data[0]));
          index++;
        } else {
          News news = await getNewsById(topIds[index]);
          if (news != null) {
            newList.add(news);
            await NewsService().saveNews(news);
            index++;
          }
        }
      }
    } else {
      if (allData.isEmpty) {
        await getFromTable();
        for (int i = 0; i < 10; i++, index++) {
          if (allData.length > index) {
            newList.add(News.fromJson(allData[index]));
          }
        }
      }
      newsList.addAll(newList);
      notifyListeners();
    }
  }
}
