import 'dart:convert';

import 'package:movies/business_logic/models.dart/api_response.dart';
import 'package:movies/business_logic/models.dart/movies_model.dart';
import 'package:movies/business_logic/models.dart/view_model/movies_view_model.dart';

final popularMovieKey =
    "https://api.themoviedb.org/3/movie/popular?api_key=4f307f671b70984e23de1dfa7090373c";

Future<ApiResponse<Welcome>> getmovies(String _token) {
  return MovieViewModel().getApi(popularMovieKey, token: _token,
      transform: (dynamic res) {
    return Welcome.fromMap(res);
  });
}
