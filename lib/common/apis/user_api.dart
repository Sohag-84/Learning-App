import 'dart:developer';

import 'package:learning_app/common/entities/entities.dart';
import 'package:learning_app/common/utils/http_util.dart';

class UserApi {
  static login({LoginRequestEntity? params}) async {
    log("Login api is called");
    var response = await HttpUtil().post(
      "api/auth/register",
      queryParameters: params?.toJson(),
    );
    log("Data: $response");
    return UserLoginResponseEntity.fromJson(response);
  }
}
