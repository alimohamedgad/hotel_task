// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  final _baseUrl = 'https://www.hotelsgo.co/test/';
  final Dio _dio;
  ApiService(
    this._dio,
  );

  Future<List<dynamic>> get({required String endPoint}) async {
    final response = await _dio.get("$_baseUrl$endPoint");

    if (kDebugMode) {
      print(response.data);
    }
    return response.data;
  }
}
