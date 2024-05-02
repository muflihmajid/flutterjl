import 'dart:convert';
import 'dart:async';
import 'dart:developer';

import 'package:skeleton_mobileapps/app/infrastructure/event/dio_error.dart';
import 'package:skeleton_mobileapps/data/infrastructures/api_service_interface.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:event_bus/event_bus.dart';

class ApiService extends ApiServiceInterface {
  late Dio _dio;
  late EventBus _eventBus;
  late bool _needThrowError;

  ApiService(Dio dio, EventBus eventBus) {
    _dio = dio;
    _eventBus = eventBus;
    _needThrowError = false;
  }

  // send http request
  @override
  Future<Map<String, dynamic>> invokeHttp(dynamic url, RequestType type,
      {Map<String, String>? headers,
      dynamic body,
      Map<String, String>? params,
      Encoding? encoding,
      bool needThrowError = true}) async {
    Response response;
    _needThrowError = needThrowError;
    try {
      response = await _invoke(url, type,
          headers: headers, body: jsonEncode(body), params: params);
    } catch (error) {
      log("error api service $error");
      rethrow;
    }

    return response.data;
  }

  // setup requiest type and configuration
  Future<Response> _invoke(dynamic url, RequestType type,
      {Map<String, String>? headers,
      dynamic body,
      Map<String, String>? params}) async {
    Response response;
    try {
      switch (type) {
        case RequestType.get:
          response = await _dio.get(
            url,
            options: buildCacheOptions(Duration(days: 7),
                options: Options(headers: headers),
                forceRefresh: true,
                maxStale: const Duration(days: 7)),
            queryParameters: params,
          );
          break;
        case RequestType.post:
          response = await _dio.post(url,
              data: body,
              options: Options(
                headers: headers,
              ));
          break;
        case RequestType.put:
          response = await _dio.put(url,
              data: body, options: Options(headers: headers));
          break;
        case RequestType.patch:
          response = await _dio.patch(url,
              data: body, options: Options(headers: headers));
          break;
        case RequestType.delete:
          response = await _dio.delete(url, options: Options(headers: headers));
          break;
      }
      return response;
    } on DioError catch (e) {
      notifyError(e.response);
      rethrow;
    } catch (error) {
      rethrow;
    }
  }

  void notifyError(Response? resp) {
    if (!_needThrowError) return;

    _eventBus.fire(DioErrorEvent(
        code: resp?.statusCode ?? 408,
        message: resp == null || resp.data is String
            ? 'Connection Timeout'
            : resp.data['message'],
        origin: resp == null || resp.data is String
            ? 'default'
            : resp.data['origin']));
  }
}
