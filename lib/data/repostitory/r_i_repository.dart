import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';


part 'r_i_repository.g.dart';

@RestApi()
abstract class RIRepository {
  factory RIRepository(Dio dio, {String baseUrl}) = _RIRepository;

}