import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:rotary_flutter/data/model/article_model.dart';


part 'article_repository.g.dart';

@RestApi()
abstract class ArticleRepository {
  factory ArticleRepository(Dio dio, {String baseUrl}) = _ArticleRepository;

  @GET("/article/{id}")
  Future<List<Article>> getArticle(@Path("id") int? id);
}