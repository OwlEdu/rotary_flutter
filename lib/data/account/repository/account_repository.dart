import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/account_model.dart';

part 'account_repository.g.dart';

@RestApi()
abstract class AccountRepository {
  factory AccountRepository(Dio dio, {String baseUrl}) = _AccountRepository;

  @GET("/account")
  Future<List<Account>> getAccount(
    @Query('cellphone') String? cellphone
  );
}