import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:alfiyahgroupppsfluter/api/AlfiyahAPI.dart';
import 'package:dio/dio.dart';

class ApiService {
  Future<dynamic> loginUser(String user, String password) async {
    try {
      Options options = Options(
        contentType: ContentType.parse('application/json'),
      );

      Response response = await AlfiyahAPI.dio.post(AlfiyahAPI.getLogin(user, password),
          data: {}, options: options);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseJson = json.decode(response.data);
        return responseJson;
      } else if (response.statusCode == 401) {
        throw Exception("Incorrect Email/Password");
      } else{
        throw Exception('Authentication Error');}
    } on DioError catch (exception) {

    }
  }

  Future<dynamic> getAllJob(String user) async {
    try {
      Options options = Options(
        contentType: ContentType.parse('application/json'),
      );

      Response response = await AlfiyahAPI.dio.post(AlfiyahAPI.getAllJob(user),
          data: {}, options: options);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseJson = json.decode(response.data);
        return responseJson;
      } else if (response.statusCode == 401) {
        throw Exception("Incorrect Email/Password");
      } else{
        throw Exception('Authentication Error');}
    } on DioError catch (exception) {

    }
  }

}