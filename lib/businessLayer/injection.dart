import 'package:dio/dio.dart';

Dio CreateAndSetupDio()
  {
    Dio dio=Dio();
    dio..options.receiveTimeout=Duration(seconds: 30000)
    ..options.connectTimeout=Duration(seconds: 10000);
   dio.interceptors.add(LogInterceptor(
    error: true,
    requestBody: true,
    responseBody: true,
    requestHeader: false,
    responseHeader: false,
    request: true,
   ));
   
   
   return dio;



  }