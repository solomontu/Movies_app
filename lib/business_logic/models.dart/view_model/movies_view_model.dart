import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:movies/business_logic/models.dart/services/movie_services.dart';

class MovieViewModel {
  MovieServices? _movieServices;

  String? errorStatus;

  MovieViewModel() {
    _movieServices = MovieServices();
    errorStatus = '';
  }

  //GET POPULAR MOVIES
  Future<Map<String, dynamic>?> getPopularMovies(String token) async {
    http.Response? response = await _movieServices!.getPopularMovies(token);
    Map<String, dynamic>? responseData;
    if (response!.statusCode == 200) {
      responseData = await jsonDecode(response.body);

      // print('THE VIEW MODEL RESPONS IS:${response.body}');
    } else {
      errorStatus = response.body;
      print('THE ERROR STATUS IS: $errorStatus');
    }
    return responseData;
  }

  //GET TOP RATED MOVIES
  Future<Map<String, dynamic>?> getTopRatedMovies(String token) async {
    http.Response? response = await _movieServices!.getTopRatedMovies(token);
    Map<String, dynamic>? responseData;
    if (response!.statusCode == 200) {
      responseData = jsonDecode(response.body);
      return responseData;
    } else {
      errorStatus = response.body;
      print('THE ERROR STATUS IS: $errorStatus');
    }
    return responseData;
  }

  //GET UpcomIng MOVIES
  Future<Map<String, dynamic>?> getUpComingMovies(String token) async {
    http.Response? response = await _movieServices!.getUpcomingMovies(token);
    Map<String, dynamic>? responseData;
    if (response!.statusCode == 200) {
      responseData = jsonDecode(response.body);
      return responseData;
    } else {
      errorStatus = response.body;
      print('THE ERROR STATUS IS: $errorStatus');
    }
    return responseData;
  }
}
