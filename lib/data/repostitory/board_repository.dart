import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../model/board_model.dart';

part 'board_repository.g.dart';

@RestApi()
abstract class BoardRepository {
  factory BoardRepository(Dio dio, {String baseUrl}) = _BoardRepository;

  @GET("/board/{id}")
  Future<List<Board>> getBoard(
      @Path("id") int? id
      );
}