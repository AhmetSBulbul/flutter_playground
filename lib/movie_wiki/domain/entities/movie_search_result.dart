import 'package:equatable/equatable.dart';
import 'package:flutter_playground/movie_wiki/domain/entities/movie_thumbnail.dart';

class MovieSearchResult extends Equatable {
  final List<MovieThumbnail> search;
  final int totalResults;

  MovieSearchResult(this.search, this.totalResults);
  @override
  List<Object?> get props => [search, totalResults];
}
