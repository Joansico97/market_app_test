import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class _DioService {
  static final Dio _dio = Dio();

  Future<dynamic> getData({required String url, required String auth}) async {
    try {
      final data = await _dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': auth,
          },
        ),
      );

      return data.data;
    } on DioError catch (e) {
      debugPrint('$e');
      debugPrint('Error while bringing the information');
      rethrow;
    }
  }

  Future<dynamic> postDataLogin({
    required String url,
    required String userName,
    required String password,
  }) async {
    try {
      final data = await _dio.post(
        url,
        data: {
          'username': userName,
          'password': password,
        },
      );
      return data.data;
    } on DioError {
      debugPrint('Error while posting the information');
      rethrow;
    }
  }
}

final dioService = _DioService();
