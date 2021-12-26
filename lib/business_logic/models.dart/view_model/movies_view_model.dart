import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:movies/business_logic/models.dart/api_response.dart';
import 'package:movies/business_logic/models.dart/services/movie_services.dart';

class MovieViewModel {
  MovieServices? _movieServices;

  String? errorStatus;

  MovieViewModel() {
    _movieServices = MovieServices();
    errorStatus = '';
  }

  //GET POPULAR MOVIES
  Future<Map<String, dynamic>?> getPopularMovies(String _token) async {
    http.Response? response =
        await _movieServices!.getPopularMovies(_token, 'popularMovieKey');
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

  Future<ApiResponse<T>> getApi<T>(
    String url, {
    T Function(dynamic)? transform,
    bool skipStatusCheck = false,
    Map<String, String>? params,
    String? token,
  }) async {
    transform ??= (dynamic r) => r.body as T;
    params ??= <String, String>{};

    final ApiResponse<T> apiResponse = ApiResponse<T>();

    try {
//      final Map<String, String> headers = await httpHeaders();
//      final Uri uri = AppConfig.apiProtocol.startsWith('https')
//          ? Uri.https(AppConfig.apiDomain, AppConfig.apiPath(url), params)
//          : Uri.http(AppConfig.apiDomain, AppConfig.apiPath(url), params);
//
//      final http.Response res = await http.get(
//        uri,
//        headers: headers,
//      );
//
//      final dynamic data = json.decode(res.body ?? '');
//
//      if (skipStatusCheck || res.statusCode == 200 || res.statusCode == 201) {
//        apiResponse.data = transform(data);
//      } else {
//        apiResponse.error = true;
//        apiResponse.message =
//            (data['message'] ?? 'Error encountered').toString();
//      }

      final http.Response? res =
          await _movieServices!.getPopularMovies(token!, url);
      final dynamic data = json.decode(res!.body);

      if (skipStatusCheck || res.statusCode == 200 || res.statusCode == 201) {
        apiResponse.data = transform(data);
      } else {
        apiResponse.error = true;
        apiResponse.message =
            (data['message'] ?? 'Error encountered').toString();
      }
    } catch (e) {
//      errorStatus = response.body;
      print('THE ERROR STATUS IS:');
    }

    return apiResponse;
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
