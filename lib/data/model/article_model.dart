import 'package:json_annotation/json_annotation.dart';

import 'account_model.dart';

part 'article_model.g.dart';

@JsonSerializable()
class Article {
  Account? account;
  Board? board;
  String? title;
  String? content;

  Article({this.account, this.board, this.title, this.content});

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

@JsonSerializable()
class Board {
  String? name;

  Board({this.name});

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);
  Map<String, dynamic> toJson()  => _$BoardToJson(this);
}