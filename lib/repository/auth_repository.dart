import 'package:flutter/material.dart';
import 'package:new_mvvm/data/network/base_api_service.dart';
import 'package:new_mvvm/resources/app_url.dart';

import '../data/network/network_api_service.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();

  /* ----------- login ---------------- */
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      debugPrint("err from login auth repo - $e");
      throw e.toString();
      // rethrow;
    }
  }

  /* ----------- register ---------------- */
  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registerUrl, data);
      return response;
    } catch (e) {
      debugPrint("err from register auth repo - $e");
      throw e.toString();
    }
  }
}
