import 'package:dio/dio.dart';

import 'package:ecommerce/core/data/api.dart';
import 'package:ecommerce/core/data/base_api_impl.dart';
import 'package:ecommerce/core/data/dio_logger.dart';
import 'package:ecommerce/core/models/api/api_response.dart';
import 'package:ecommerce/injector.dart';
import 'package:flutter/material.dart';

class BaseApi implements BaseAPIImpl {
  Dio? _dio;
  final endpoint = locator<Api>();

  BaseApi({Dio? dio}) {
    _dio = dio ?? Dio();
    _dio?.interceptors.add(Logging());
  }

  @override
  Future<APIResponse> delete(
      String url, Map<String, dynamic>? param, bool? useToken) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<APIResponse> get(
      String url, Map<String, dynamic>? param, bool? useToken) async {
    try {
      final result = await _dio?.get(
        url,
        options: await _getHeaders(useToken: useToken),
        queryParameters: param,
      );
      return _parseResponse(result);
    } on DioException catch (e) {
      debugPrint('Error: get');
      debugPrint('STATUS: ${e.response?.statusCode}');
      debugPrint('DATA: ${e.response?.data}');
      debugPrint('HEADERS: ${e.response?.headers}');
      return APIResponse.failure(
        e.response?.data['message'] ?? e.response?.data['error'] ?? e.message,
        e.response?.statusCode ?? 0,
      );
    }
  }

  @override
  Future<APIResponse> post(
      String url, Map<String, dynamic>? param, data, bool? useToken) async {
    try {
      final result = await _dio?.post(
        url,
        options: await _getHeaders(useToken: useToken),
        queryParameters: param,
        data: data,
      );
      return _parseResponse(result);
    } on DioException catch (e) {
      debugPrint('Error: get');
      debugPrint('STATUS: ${e.response?.statusCode}');
      debugPrint('DATA: ${e.response?.data}');
      debugPrint('HEADERS: ${e.response?.headers}');
      return APIResponse.failure(
        e.response?.data['message'] ?? e.response?.data['error'] ?? e.message,
        e.response?.statusCode ?? 0,
      );
    }
  }

  @override
  Future<APIResponse> update(
      String url, Map<String, dynamic>? param, data, bool? useToken) {
    // TODO: implement update
    throw UnimplementedError();
  }

  Future<APIResponse> _parseResponse(Response? response) async {
    return APIResponse.fromJson(
      {
        'status': response?.data['status'],
        'data': response?.data,
        'message': response?.data['message'] ??
            (response?.data['error'] ?? response?.statusMessage),
      },
      response?.statusCode ?? 0,
    );
  }

  Future<Options> _getHeaders({bool? useToken}) async {
    var header = <String, dynamic>{};
    header['Accept'] = 'application/json';
    header['Content-Type'] = 'application/json';

    if (useToken == true) {
      header['Authorization'] = 'Bearer <Token>';
    }
    return Options(
      headers: header,
      sendTimeout: const Duration(seconds: 60), // 60 seconds
      receiveTimeout: const Duration(seconds: 60), // 60 seconds
    );
  }
}
