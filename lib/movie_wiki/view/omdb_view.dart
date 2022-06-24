import 'package:flutter/material.dart';
import 'package:flutter_playground/movie_wiki/data/models/movie_thumbnail_model/movie_thumbnail_model.dart';
import 'package:flutter_playground/movie_wiki/data/remote_source.dart';

class OmdbView extends StatefulWidget {
  const OmdbView({Key? key}) : super(key: key);

  @override
  State<OmdbView> createState() => _OmdbViewState();
}

class _OmdbViewState extends State<OmdbView> {
  late OmdbRemoteSource _source;
  String searchVal = '';
  String posterUrl = '';
  List<MovieThumbnailModel> movies = [];
  @override
  void initState() {
    super.initState();
    _source = OmdbRemoteSource();
  }

  //movies.map((e) => Text(e.title)).toList()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
            child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) => searchVal = value,
              decoration: InputDecoration(
                label: Text('Enter the name'),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  // final OmdbMovieModel model =
                  //     await _source.getMovie(searchVal);
                  final List<MovieThumbnailModel> movieList =
                      await _source.getMovieList(searchVal);
                  setState(() {
                    movies = movieList;
                  });
                },
                child: Text('Search')),
            ...movies.map((e) => Text(e.title)).toList()
            // if (posterUrl.isNotEmpty) Image.network(posterUrl),
          ],
        )),
      ),
    );
  }
}
