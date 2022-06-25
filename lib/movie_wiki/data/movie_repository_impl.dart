import 'package:flutter_playground/app/core/exceptions.dart';
import 'package:flutter_playground/app/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_playground/movie_wiki/data/remote/remote_source.dart';
import 'package:flutter_playground/movie_wiki/domain/entities/movie.dart';
import 'package:flutter_playground/movie_wiki/domain/entities/movie_search_result.dart';
import 'package:flutter_playground/movie_wiki/domain/repositories/movie_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: IMovieRepository, signalsReady: true)
class MovieRepositoryImpl implements IMovieRepository {
  final IOmdbRemoteSource _remoteSource;
  MovieRepositoryImpl(this._remoteSource);

  @override
  Future<Either<Failure, Movie>> getMovieById(String imdbId) async {
    try {
      final movie = await _remoteSource.getMovieById(imdbId: imdbId);
      return Right(movie);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Movie>> getMovieByTitle(String title) async {
    try {
      final movie = await _remoteSource.getMovieByTitle(title: title);
      return Right(movie);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MovieSearchResult>> searchMovies(String title,
      {String type = '', String year = '', String page = ''}) async {
    try {
      final searchResult = await _remoteSource.searchMovieList(title: title);
      return Right(searchResult);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
