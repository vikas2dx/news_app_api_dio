import 'dart:convert';

import 'package:dio/dio.dart';

class ApiInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) async {
    if (response != null && response.data != null) {
      String message = jsonEncode(response?.data).toString();
      print(message);
    } else {
      print(" Response : response!=null && response.data !=null is Invalid");
    }
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print(" Error Message : " + err.message);
    return super.onError(err);
  }
}
