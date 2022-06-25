import 'dart:convert';

import 'package:flutter_playground/app/core/exceptions.dart';
import 'package:flutter_playground/movie_wiki/data/remote/models/movie_detailed_model.dart/movie_model.dart';
import 'package:flutter_playground/movie_wiki/data/remote/models/movie_search_result_model/movie_search_result_model.dart';
import 'package:flutter_playground/movie_wiki/data/remote/models/movie_thumbnail_model/movie_thumbnail_model.dart';
import 'package:flutter_playground/movie_wiki/secrets.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract class IOmdbRemoteSource {
  Future<MovieModel> getMovieById({required String imdbId});
  Future<MovieModel> getMovieByTitle({required String title});
  Future<MovieSearchResultModel> searchMovieList({required String title});
}

@Singleton(as: IOmdbRemoteSource)
class OmdbRemoteSource implements IOmdbRemoteSource {
  final String baseUrl =
      'http://www.omdbapi.com/?apikey=${Secrets.OMDB_API_KEY}&';
  @override
  Future<MovieModel> getMovieById({required String imdbId}) async {
    final response = await http.get(Uri.parse('$baseUrl&i=$imdbId'));
    if (response.statusCode == 200) {
      return MovieModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieSearchResultModel> searchMovieList(
      {required String title}) async {
    final response = await http.get(Uri.parse('$baseUrl&s=$title'));
    if (response.statusCode == 200) {
      print('girdi');
      return MovieSearchResultModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieModel> getMovieByTitle({required String title}) async {
    final response = await http.get(Uri.parse('$baseUrl&i=$title'));
    if (response.statusCode == 200) {
      return MovieModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}

// class OmdbRemoteSource {
//   // final http.Client client;

//   // OmdbRemoteSource(this.client);

//   Future<MovieModel> getMovie(String title) async {
//     final response = await http.Client().get(Uri.parse(
//         'http://www.omdbapi.com/?t=$title&apikey=${Secrets.OMDB_API_KEY}'));
//     if (response.statusCode == 200) {
//       return MovieModel.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to load omdb');
//     }
//   }

//   Future<List<MovieThumbnailModel>> getMovieList(String title) async {
//     final response = await http.Client().get(Uri.parse(
//         'http://www.omdbapi.com/?s=$title&apikey=${Secrets.OMDB_API_KEY}'));
//     if (response.statusCode == 200) {
//       return (json.decode(response.body)['Search'] as List)
//           .map((e) => MovieThumbnailModel.fromJson(e))
//           .toList();
//     } else {
//       throw Exception('Failed to load omdb');
//     }
//   }
// }
