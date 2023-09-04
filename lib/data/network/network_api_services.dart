import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:getx_mvvm/data/network/base_api_services.dart';

import '../app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }

    dynamic responseJSon;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJSon = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJSon;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJSon;
    try {
      final response =
          await http.post(Uri.parse(url),
          body: jsonEncode(data)
          ).timeout(Duration(seconds: 10));
      responseJSon = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJSon;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw FetchDataException(
            'Error occured while communicationwith server ' +
                response.statusCode.toString());
    }
  }
}
