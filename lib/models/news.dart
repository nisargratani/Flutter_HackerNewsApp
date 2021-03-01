import 'package:json_annotation/json_annotation.dart';
part 'news.g.dart';

@JsonSerializable(nullable: false)
class News {
  News({this.date, this.id, this.title, this.url});
  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  int id;
  String title;
  String url;
  int date;
  /*newsToMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['title'] = title;
    mapping['date'] = date;
    mapping['url'] = url;
  }*/

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
