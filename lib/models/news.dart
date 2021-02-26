class News {
  int id;
  String title;
  String url;
  int date;
  newsToMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['title'] = title;
    mapping['date'] = date;
    mapping['url'] = url;
  }
}
