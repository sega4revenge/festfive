import 'package:festfive/Config/ConfigBase.dart';
import 'package:dio/dio.dart';
import 'package:festfive/Config/Result.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'APIResponse.dart';
import 'APIRouteConfigurable.dart';
import 'AuthInterceptor.dart';
import 'TypeDecodable.dart';

abstract class BaseAPIClient {

  Future<Result> request<T extends Decodable>({
    @required APIRouteConfigurable route,
    Create<T>? create,
    dynamic data,
  });

}
class APIClient implements BaseAPIClient {

  final BaseOptions options = BaseOptions(baseUrl: ConfigBase.BASE_URL);
  Dio? instance;

  APIClient() {
    instance = Dio(options)..interceptors.add(AuthInterceptor())
      ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));;
  }

  @override
  Future<Result> request<T extends Decodable>({
    @required APIRouteConfigurable? route,
    Create<T>? create,
    dynamic data,
  }) async {
    final config = route?.getConfig();
    if (config == null)  {
      final error = ErrorResponse(
          message: 'Config Null', statusCode: 400
      );
      return Result.error(error);
    }
    config.baseUrl = options.baseUrl;
      try {
        final response = await instance?.fetch(config);
        if (response == null) {
          final error = ErrorResponse(
              message: 'Response Null', statusCode: 400
          );
          return Result.error(error);
        }

        final responseData = response.data;
        if (create != null) {
          ResponseWrapper responseWrapper = ResponseWrapper.init(create: create, json: responseData);
          return Result.success(responseWrapper.response);
        } else {
          ResponseWrapper responseWrapper = ResponseWrapper.init(create: () => APIResponse(create: () => NoData()), json: responseData);
              return Result.success(responseWrapper.response);
        }
      } on DioError catch (e) {
        final responseData = e.response?.data;
        if (create != null) {
          ResponseWrapper responseWrapper = ResponseWrapper.init(create: create, json: responseData);
          return Result.error(responseWrapper.response);
        } else {
          ResponseWrapper responseWrapper = ResponseWrapper.init(create: () => APIResponse(create: () => NoData()), json: responseData);
          return Result.error(responseWrapper.response);
        }
      }

  }
}

class NoData implements Decodable<NoData> {
  String name = '';
  String symbol = '';
  int rank = 0;

  @override
  NoData decode(dynamic data) {
    return this;
  }

}