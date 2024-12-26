// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      account: json['account'] == null
          ? null
          : Account.fromJson(json['account'] as Map<String, dynamic>),
      board: json['board'] == null
          ? null
          : Board.fromJson(json['board'] as Map<String, dynamic>),
      title: json['title'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'account': instance.account,
      'board': instance.board,
      'title': instance.title,
      'content': instance.content,
    };

Board _$BoardFromJson(Map<String, dynamic> json) => Board(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$BoardToJson(Board instance) => <String, dynamic>{
      'name': instance.name,
    };
