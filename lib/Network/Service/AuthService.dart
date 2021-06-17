
import 'package:dio/dio.dart';
import 'package:festfive/Config/Result.dart';

import '../APIClient.dart';
import '../APIResponse.dart';
import '../APIRouteConfigurable.dart';

enum AuthRequest {
  authStartupPassword
}

class AuthRequestParams {
  static Map<String, dynamic> authStartupPassword(String password) {
    return {'password': password};
  }
}

class AuthRouter implements APIRouteConfigurable {

  final AuthRequest type;
  final Map<String, dynamic>? routeParams;

  AuthRouter(this.type, { this.routeParams });

  @override
  RequestOptions getConfig() {
    switch (type) {
      case AuthRequest.authStartupPassword:
        return RequestOptions(
            path: 'users/check-password',
            method: APIMethod.post,
            queryParameters: routeParams
        );
    }
  }
}

class AuthService {
  //Creating Singleton

  final APIClient client = APIClient();

  Future<Result> authStartupPassword(String password) async {
    AuthRouter router = AuthRouter(AuthRequest.authStartupPassword, routeParams: AuthRequestParams.authStartupPassword(password));
    var result = await client.request<APIResponse<bool>>(
        route: router
    );
    return result;
  }
}

