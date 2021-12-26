import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class MovieServices {
  final popularMovieKey =
      "https://api.themoviedb.org/3/movie/popular?api_key=4f307f671b70984e23de1dfa7090373c";
  Map<String, String> header = {"Content-Type": "application/json"};
  http.Client? httpClient;
  MovieServices() : httpClient = http.Client();

  Future<http.Response?> getPopularMovies(String token, String _url) async {
    Uri url = Uri.parse(_url);
//    Uri url = Uri.parse("$popularMovieKey");
    final client = RetryClient(httpClient!);
    http.Response? response;
    try {
      response = await client.get(url, headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: "application/json",
      });
    } catch (e) {
      print("Error getting movies");
    }
    // print('THE RESPONS IS:${response!.body}');

    return response;
  }

  //top rated movies
  final topRatedMovieKey =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=4f307f671b70984e23de1dfa7090373c";

  Future<http.Response?> getTopRatedMovies(String token) async {
    Uri url = Uri.parse("$topRatedMovieKey");

    http.Response? response;
    try {
      response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: "application/json",
      });
    } catch (e) {
      print("Error getting an estimate");
    }
    return response;
  }

  //top rated movies
  final upComingMovieKey =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=4f307f671b70984e23de1dfa7090373c";

  Future<http.Response?> getUpcomingMovies(String token) async {
    Uri url = Uri.parse("$upComingMovieKey");

    http.Response? response;
    try {
      response = await http.get(url, headers: {
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: "application/json",
      });
    } catch (e) {
      print("Error getting an estimate");
    }
    return response;
  }
}
