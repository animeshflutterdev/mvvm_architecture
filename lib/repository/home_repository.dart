import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:new_mvvm/model/movie_model.dart';

import '../data/network/base_api_service.dart';
import '../data/network/network_api_service.dart';
import '../resources/app_url.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiService();

  /* ----------- movies list ---------------- */
  Future<MoviesModel> moviesListApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
        AppUrl.movieList,
      );
      dynamic resp = response = MoviesModel.fromJson(response);
      dev.log("movies list response - $resp");
      return resp;
    } catch (e) {
      debugPrint("err from login auth repo - $e");
      throw e.toString();
      // rethrow;
    }
  }
}
