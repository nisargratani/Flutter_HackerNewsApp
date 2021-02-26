import 'package:flutter/material.dart';
import 'package:flutter_hackernewsapp/models/news.dart';
import 'package:flutter_hackernewsapp/screens/top_news.dart';
import 'package:flutter_hackernewsapp/services/network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  List<int> newsIds = List<int>();
  List<News> newsList = List<News>();
  void getData() async {
    NetworkHelper networkHelper = NetworkHelper();
    var ids = await networkHelper.getIds();
    for (int i = 0; i < 20; i++) {
      newsIds.add(ids[i]);
    }
    for (int i = 0; i < 20; i++) {
      var data = await networkHelper.getData(newsIds[i]);
      News news = News();
      news.title = data['title'];
      news.date = data['time'];
      news.url = data['url'];
      news.id = data['id'];
      newsList.add(news);
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TopNews(
          newsData: newsList,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
