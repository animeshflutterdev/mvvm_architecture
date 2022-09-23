import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_mvvm/data/response/api_response.dart';
import 'package:new_mvvm/model/movie_model.dart';
import 'package:new_mvvm/repository/home_repository.dart';

import '../utils/utils.dart';

class HomeViewModel extends ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<MoviesModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MoviesModel> response){
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMovieViewModel(BuildContext context) async {

    setMoviesList(ApiResponse.loading());
    _myRepo.moviesListApi().then((value) {
      setMoviesList(ApiResponse.completed(value));
      Utils().showMessage(value.toString(), Colors.green);
      if (kDebugMode) {
        print("login AuthViewModel Value $value");
      }
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
      Utils().showMessage(error.toString(), Colors.red);
      if (kDebugMode) {
        print("login AuthViewModel error $error");
      }
    });
  }
}
