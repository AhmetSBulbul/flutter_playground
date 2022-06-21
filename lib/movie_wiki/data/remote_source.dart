import 'package:flutter_playground/movie_wiki/data/models/omdb_model.dart';
import 'package:flutter_playground/movie_wiki/secrets.dart';
import 'package:http/http.dart' as http;

class OmdbRemoteSource {
  // final http.Client client;

  // OmdbRemoteSource(this.client);

  Future<OmdbModel> getMovie(String title) async {
    final response = await http.Client().get(Uri.parse(
        'http://www.omdbapi.com/?t=$title&apikey=${Secrets.OMDB_API_KEY}'));
    if (response.statusCode == 200) {
      return OmdbModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load omdb');
    }
  }
}
