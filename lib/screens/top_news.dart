import 'package:flutter/material.dart';
import 'package:flutter_hackernewsapp/models/new_list.dart';
import 'package:flutter_hackernewsapp/screens/loading_screen.dart';
import 'package:provider/provider.dart';

class TopNews extends StatefulWidget {
  @override
  _TopNewsState createState() => _TopNewsState();
}

class _TopNewsState extends State<TopNews> {
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    Provider.of<NewsList>(context, listen: false).getNextNews();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        await Provider.of<NewsList>(context, listen: false).getNextNews();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Consumer<NewsList>(
        builder: (BuildContext context, NewsList value, Widget child) => (value
                .newsList.isEmpty)
            ? LoadingScreen()
            : ListView.builder(
                controller: _scrollController,
                itemCount: value.newsList.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index != value.newsList.length) {
                    return Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Card(
                        elevation: 5.0,
                        child: ListTile(
                          onTap: () {
                            //TODO : Add News Screen
                          },
                          title: Text(value.newsList[index].title),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('id'),
                              Text('${value.newsList[index].id}'),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        height: 60.0,
                        width: 45.0,
                        child: Text('Process'),
                      ),
                    );
                  }
                },
              ),
      ),
    );
  }
}
