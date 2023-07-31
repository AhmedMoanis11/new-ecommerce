import 'package:dio/dio.dart';
import 'package:ecommerce_newapi/dataLayer/constance.dart';

class Dioinfo {
  static late Dio dioo;
  static init() {
    dioo = Dio(
      BaseOptions(
          baseUrl:'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
          headers: {'Content-Type': 'application/json'}),
    );
  }
//////////////////////////////////////////////////////////
  static Future<Response> GetData({
    required String urll,
    Map<String, dynamic>? queries,
    String? lang,
    
  }) async {
    dioo.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': tokens,
      'lang':'en'
    };

    return await dioo.get(urll, queryParameters: queries);
  }
  ////////////////////////////////////////////////////////

  static Future<Response> PostData({
    required String urll,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queries,
    String? lang,
    
  }) async {
    dioo.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': tokens,
      'lang':'en'
    };
    return await dioo.post(urll,data: data,queryParameters: queries);


  }
}
