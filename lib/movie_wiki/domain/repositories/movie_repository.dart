import 'package:dartz/dartz.dart';
import 'package:flutter_playground/app/core/failures.dart';
import 'package:flutter_playground/movie_wiki/domain/entities/movie.dart';
import 'package:flutter_playground/movie_wiki/domain/entities/movie_search_result.dart';

abstract class IMovieRepository {
  Future<Either<Failure, MovieSearchResult>> searchMovies(String title,
      {String type = '', String year = '', String page = ''});

  Future<Either<Failure, Movie>> getMovieById(String imdbId);
  Future<Either<Failure, Movie>> getMovieByTitle(String title);
  // Future<void> addMovieToWatchlist(Movie movie);
  // Future<void> removeMovieFromWatchlist(Movie movie);
  // Future<void> addMovieToWatched(Movie movie);
  // Future<void> removeMovieFromWatched(Movie movie);
}
