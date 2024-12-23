import 'package:rotary_flutter/data/repostitory/account_repository.dart';
import 'package:dio/dio.dart';
import 'package:rotary_flutter/data/repostitory/board_repository.dart';
import '../../util/model/state.dart';
import '../../util/common.dart';
import '../model/account_model.dart';

class BoardAPI {
  String serverUrl = "${BASE_URL}";
  Dio dio = Dio()
    ..options.connectTimeout = const Duration(seconds: 60)
    ..options.receiveTimeout = const Duration(seconds: 60)
    ..options.headers['Content-Type'] = 'application/json'
    ..options.headers['accept-Type'] = 'application/json'
    ..options.headers['Authorization'] = 'Bearer showmethemoney';

  late BoardRepository boardRepository;

  BoardAPI() {
    // dio.interceptors.add(LogInterceptor(
    //   request: true, // 요청 데이터 로깅
    //   requestHeader: true, // 요청 헤더 로깅
    //   requestBody: true, // 요청 바디 로깅
    //   responseHeader: true, // 응답 헤더 로깅
    //   responseBody: true, // 응답 바디 로깅
    //   error: true, // 에러 로깅
    // ));
    boardRepository = BoardRepository(dio, baseUrl: serverUrl);
  }

  Future<LoadState> getBoard({int? id}) async {
    try {
      final result = await boardRepository.getBoard(id);
      return Success(result);
    } catch (e) {
      return Error(e);
    }
  }
}