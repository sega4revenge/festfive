

import 'package:festfive/Config/Result.dart';
import 'package:festfive/Network/APIResponse.dart';
import 'package:festfive/Network/Service/AuthService.dart';

class LoginCodeViewModel {

  AuthService service = AuthService();

  authStartup(String password) async {
    Result response = await service.authStartupPassword(password);
    if ( response is SuccessState ) {
      print(response.value);
    } else if ( response is ErrorState ) {
      APIResponse errorResponse = response.msg;
      print(errorResponse.message);
    }
  }
}