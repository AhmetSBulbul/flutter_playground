import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_playground/app/core/failures.dart';
import 'package:flutter_playground/app/core/use_case.dart';
import 'package:flutter_playground/movie_wiki/domain/entities/movie_search_result.dart';
import 'package:flutter_playground/movie_wiki/domain/repositories/movie_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMovieSearchResult
    implements UseCase<MovieSearchResult, ParamsMovieSearch> {
  final IMovieRepository _movieRepository;

  GetMovieSearchResult(this._movieRepository);
  @override
  Future<Either<Failure, MovieSearchResult>> call(
      ParamsMovieSearch params) async {
    return await _movieRepository.searchMovies(params.title,
        type: params.type ?? '',
        year: params.year ?? '',
        page: params.page?.toString() ?? '');
  }
}

class ParamsMovieSearch extends Equatable {
  final String title;
  final int? page;
  final String? type;
  final String? year;
  const ParamsMovieSearch(this.title, {this.page, this.type, this.year});
  @override
  List<Object> get props => [title, page ?? '', type ?? '', year ?? ''];
}
