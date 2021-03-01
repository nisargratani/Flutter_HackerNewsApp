part of 'news.dart';

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
    url: json['url'] as String,
    id: json['id'] as int,
    title: json['title'] as String,
    date: json['date'] as int,
  );
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'url': instance.url,
      'title': instance.title,
      'date': instance.date,
      'id': instance.id,
    };
