import 'package:flutter/material.dart';
import 'package:flutter_playground/injection.dart';
import 'package:flutter_playground/movie_wiki/data/local/models/movie_thumbnail_local_model/movie_thumbnail_local_model.dart';
import 'package:flutter_playground/movie_wiki/data/remote/models/movie_thumbnail_model/movie_thumbnail_model.dart';
import 'package:flutter_playground/movie_wiki/data/remote/remote_source.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class OmdbView extends StatefulWidget {
  const OmdbView({Key? key}) : super(key: key);

  @override
  State<OmdbView> createState() => _OmdbViewState();
}

class _OmdbViewState extends State<OmdbView> {
  late IOmdbRemoteSource _source;
  final _thumbnailBox = Hive.box('thumbnails');
  String searchVal = '';
  String posterUrl = '';
  List<MovieThumbnailModel> movies = [];
  @override
  void initState() {
    super.initState();
    _source = locator<IOmdbRemoteSource>();
    _thumbnailBox.clear();
  }

  //movies.map((e) => Text(e.title)).toList()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                      await _source.searchMovieList(title: searchVal);
                  setState(() {
                    movies = movieList;
                  });
                },
                child: Text('Search')),
            Text('Remote'),
            Expanded(
              child: ListView(
                children: [
                  ...movies.map(
                    (e) => ListTile(
                      title: Text(e.title),
                      onTap: () {
                        _thumbnailBox.add(MovieThumbnailLocalModel(
                            e.imdbID, e.title, e.year, e.type, e.poster));
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Text('Local'),
            // if (_thumbnailBox.values.isNotEmpty)
            //   Expanded(
            //     child: ValueListenableBuilder<Box>(
            //       valueListenable: _thumbnailBox.listenable(),
            //       builder: (context, box, widget) {
            //         return ListView.builder(
            //           itemBuilder: (context, index) => ListTile(
            //             title:
            //                 Text(_thumbnailBox.values.elementAt(index).title),
            //           ),
            //         );
            //       },
            //     ),
            //   )
            // if (posterUrl.isNotEmpty) Image.network(posterUrl),
          ],
        )),
      ),
    );
  }
}
