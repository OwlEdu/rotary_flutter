import 'package:dio/dio.dart';
import 'package:rotary_flutter/data/account/models/account.dart';
import 'package:rotary_flutter/data/account/models/account_details.dart';

class AccountService {
  final dio = Dio();
  final String baseUrl = 'http://1.255.226.20:9006';

  Future<List<Account>> getAccountsByRegion(int regionId) async {
    try {
      //final response = await dio.get('$baseUrl/Rotary3700/accounts/region/$regionId');
      final options = Options(
        headers: {
          'Authorization' : 'I0V6tUaqYDXsTGPOXFWYYvpeMNM3Oft7FJPkGi3LEJnHJY4oZ2N9sNnlddA81eCo1WcCVTpMzaQrg9A6961QbRgQJYdm2bau',
        }
      );

      final response = await dio.get('$baseUrl/Rotary3700/api/account',
        options: options,
        queryParameters: {
          'region': regionId,
          'db': 'Rotary3700',
          'table': 'Account'
        }
      );

      if(response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Account.fromJson(json)).toList();
      }
      throw Exception('Account 불러오기 실패');
    } catch(e) {
      throw Exception('Error : $e');
    }
  }

  Future<AccountDetail> getAccountDetail(int accountId) async {
    try {
      final options = Options(
        headers: {
          'Authorization' : 'I0V6tUaqYDXsTGPOXFWYYvpeMNM3Oft7FJPkGi3LEJnHJY4oZ2N9sNnlddA81eCo1WcCVTpMzaQrg9A6961QbRgQJYdm2bau',
        }
      );

      final response = await dio.get('$baseUrl/Rotary3700/api/account/$accountId', options: options);
      if(response.statusCode == 200) {
        return AccountDetail.fromJson(response.data);
      }
      throw Exception('Account detail 불러오기 실패');
    } catch(e) {
      throw Exception('Error: $e');
    }
  }
}