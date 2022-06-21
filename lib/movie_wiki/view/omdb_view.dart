import 'package:flutter/material.dart';
import 'package:flutter_playground/movie_wiki/data/models/omdb_model.dart';
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
  @override
  void initState() {
    super.initState();
    _source = OmdbRemoteSource();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (posterUrl.isNotEmpty) Image.network(posterUrl),
            TextField(
              onChanged: (value) => searchVal = value,
              decoration: InputDecoration(
                label: Text('Enter the name'),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  final OmdbModel model = await _source.getMovie(searchVal);
                  setState(() {
                    posterUrl = model.poster;
                  });
                },
                child: Text('Search')),
          ],
        )),
      ),
    );
  }
}
