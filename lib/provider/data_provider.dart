import 'package:flutter/material.dart';
import 'package:mymovies/model/movie_model.dart';

class DataProvider extends ChangeNotifier {
  List<MovieModel> _moviesTrending;
  List<MovieModel> _moviesPopular;

  DataProvider() {
    _moviesTrending = [];
    _moviesPopular = [];
  }

  get moviesTrending => _moviesTrending;

  get moviesPopular => _moviesPopular;

  set moviesTrending(value) {
    _moviesTrending = value;
    notifyListeners();
  }

  set moviesPopular(value) {
    _moviesPopular = value;
    notifyListeners();
  }
}
