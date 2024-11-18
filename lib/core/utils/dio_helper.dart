import 'package:dio/dio.dart';
import 'end_points.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': token,
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': token,
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> postDataWithImage({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': token,
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: FormData.fromMap(data),
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json',
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
  static Future<Response> putDataWithImage({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'multipart/form-data',
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: FormData.fromMap(data),
    );
  }

  //static Future<Response> putData({
   // required String url,
  //   Map<String, dynamic>? query,
  //   required Map<String, dynamic> data,
  //   String lang = 'en',
  //   String? token,
  // }) async {
  //   dio.options.headers = {
  //     'lang': lang,
  //     'Authorization': token,
  //     'Content-Type': 'application/json',
  //   };
  //   return await dio.put(
  //     url,
  //     queryParameters: query,
  //     data: data,
  //   );
  // }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
      'Content-Type': 'application/json',
    };
    return await dio.delete(
      url,
      queryParameters: query,
    );
  }
}
