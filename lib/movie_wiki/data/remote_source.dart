import 'dart:convert';

import 'package:flutter_playground/movie_wiki/data/models/remote/movie_detailed_model.dart/movie_model.dart';
import 'package:flutter_playground/movie_wiki/data/models/remote/movie_thumbnail_model/movie_thumbnail_model.dart';
import 'package:flutter_playground/movie_wiki/secrets.dart';
import 'package:http/http.dart' as http;

class OmdbRemoteSource {
  // final http.Client client;

  // OmdbRemoteSource(this.client);

  Future<MovieModel> getMovie(String title) async {
    final response = await http.Client().get(Uri.parse(
        'http://www.omdbapi.com/?t=$title&apikey=${Secrets.OMDB_API_KEY}'));
    if (response.statusCode == 200) {
      return MovieModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load omdb');
    }
  }

  Future<List<MovieThumbnailModel>> getMovieList(String title) async {
    final response = await http.Client().get(Uri.parse(
        'http://www.omdbapi.com/?s=$title&apikey=${Secrets.OMDB_API_KEY}'));
    if (response.statusCode == 200) {
      return (json.decode(response.body)['Search'] as List)
          .map((e) => MovieThumbnailModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load omdb');
    }
  }
}
