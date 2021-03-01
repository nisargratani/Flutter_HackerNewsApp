import 'package:flutter/material.dart';
import 'package:flutter_hackernewsapp/models/new_list.dart';
import 'package:flutter_hackernewsapp/screens/top_news.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewsList>(
      create: (BuildContext context) => NewsList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: TopNews(),
      ),
    );
  }
}
