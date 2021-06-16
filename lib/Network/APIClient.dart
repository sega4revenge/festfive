import 'package:festfive/Config/ConfigBase.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'APIResponse.dart';
import 'APIRouteConfigurable.dart';
import 'TypeDecodable.dart';

abstract class BaseAPIClient {

  Future<ResponseWrapper<T>> request<T extends Decodable>({
    @required APIRouteConfigurable route,
    @required Create<T> create,
    dynamic data,
  });

}
class APIClient implements BaseAPIClient {

  final BaseOptions options = BaseOptions(baseUrl: ConfigBase.BASE_URL);
  Dio? instance;

  APIClient() {
    instance = Dio(options);
  }

  @override
  Future<ResponseWrapper<T>> request<T extends Decodable>({
    @required APIRouteConfigurable? route,
    @required Create<T>? create,
    dynamic data,
  }) async {
    
    final config = route?.getConfig();
    if (config == null)  {
      final error = ErrorResponse(
          message: 'Config Null'
      );
      throw error;
    }
    config.baseUrl = options.baseUrl;
      final response = await instance?.fetch(config);
      if (response == null) {
        final error = ErrorResponse(
            message: 'Response Null'
        );
        throw error;
      }
      final responseData = response.data;
      if (response.statusCode == 200 && create != null) {
        return ResponseWrapper.init(create: create, json: responseData);
      }

      final errorResponse = ErrorResponse(
          message: 'Request failed with status code: ${response.statusCode}'
      );

      throw errorResponse;


  }

}