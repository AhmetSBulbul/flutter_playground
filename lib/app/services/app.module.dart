import 'package:flutter_playground/app/services/hive.service.dart';
import 'package:flutter_playground/movie_wiki/data/models/local/movie_thumbnail_local_model/movie_thumbnail_local_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

// App Module manages the dependency injection of the application.

@module
abstract class AppModule {
  @preResolve
  Future<Box<MovieThumbnailLocalModel>> get thumbnailBox =>
      HiveService.initThumbnailBox();
}
