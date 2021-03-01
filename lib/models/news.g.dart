part of 'news.dart';

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
    id: json['id'] as int,
    title: json['title'] as String,
    date: json['date'] as int,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': instance.date,
      'url': instance.url,
    };
