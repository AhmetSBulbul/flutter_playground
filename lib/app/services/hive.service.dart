import 'package:flutter_playground/movie_wiki/data/models/local/movie_detailed_local_model/movie_local_model.dart';
import 'package:flutter_playground/movie_wiki/data/models/local/movie_thumbnail_local_model/movie_thumbnail_local_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static Future<Box<MovieThumbnailLocalModel>> initThumbnailBox() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MovieLocalModelAdapter());
    Hive.registerAdapter(MovieThumbnailLocalModelAdapter());

    return await Hive.openBox('thumbnails');
  }
}
