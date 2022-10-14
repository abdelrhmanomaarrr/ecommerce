import 'package:dio/dio.dart';
import 'end_point.dart';

class DioHelper{
  static  Dio dio= Dio(
      BaseOptions(
        baseUrl: BASEURL,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type':'application/json',
        },
      )
  );
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async{
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data
  })async {
    return dio.post(
        url,
        queryParameters: query,
        data: data);
  }
}
