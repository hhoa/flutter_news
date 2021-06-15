// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListNewsModel _$ListNewsModelFromJson(Map<String, dynamic> json) {
  return ListNewsModel(
    status: json['status'] as String,
    totalResults: json['totalResults'] as int? ?? 1,
    articles: (json['articles'] as List<dynamic>?)
            ?.map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$ListNewsModelToJson(ListNewsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return NewsModel(
    source: NewsSource.fromJson(json['source'] as Map<String, dynamic>),
    author: json['author'] as String?,
    title: json['title'] as String,
    description: json['description'] as String?,
    url: json['url'] as String,
    urlToImage: json['urlToImage'] as String?,
    publishedAt: DateTime.parse(json['publishedAt'] as String),
    content: json['content'] as String,
  );
}

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'content': instance.content,
    };

NewsSource _$NewsSourceFromJson(Map<String, dynamic> json) {
  return NewsSource(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$NewsSourceToJson(NewsSource instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
