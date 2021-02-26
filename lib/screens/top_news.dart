import 'package:flutter/material.dart';
import 'package:flutter_hackernewsapp/models/news.dart';

class TopNews extends StatefulWidget {
  TopNews({this.newsData});
  final newsData;
  @override
  _TopNewsState createState() => _TopNewsState();
}

class _TopNewsState extends State<TopNews> {
  List<News> news;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateNews(widget.newsData);
  }

  void updateNews(dynamic newsData) {
    news = newsData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              print("Clicked $index");
            },
            child: Card(
              color: Colors.blueGrey,
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                title: Text(news[index].title),
              ),
            ),
          );
        },
      ),
    );
  }
}
