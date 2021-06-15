import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class ListNewsModel {
  String status;
  @JsonKey(defaultValue: 1)
  int totalResults;
  @JsonKey(defaultValue: [])
  List<NewsModel> articles;

  ListNewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory ListNewsModel.fromJson(Map<String, dynamic> json) =>
      _$ListNewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListNewsModelToJson(this);
}

@JsonSerializable()
class NewsModel {
  NewsSource source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String content;

  NewsModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}

@JsonSerializable()
class NewsSource {
  String name;

  NewsSource({required this.name});

  factory NewsSource.fromJson(Map<String, dynamic> json) =>
      _$NewsSourceFromJson(json);

  Map<String, dynamic> toJson() => _$NewsSourceToJson(this);
}
