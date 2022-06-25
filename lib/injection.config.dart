// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'movie_wiki/bloc/bloc/search_bloc_bloc.dart' as _i7;
import 'movie_wiki/data/movie_repository_impl.dart' as _i5;
import 'movie_wiki/data/remote/remote_source.dart' as _i3;
import 'movie_wiki/domain/repositories/movie_repository.dart' as _i4;
import 'movie_wiki/domain/usecases/get_movie_search_result.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.IOmdbRemoteSource>(_i3.OmdbRemoteSource());
  gh.singleton<_i4.IMovieRepository>(
      _i5.MovieRepositoryImpl(get<_i3.IOmdbRemoteSource>()),
      signalsReady: true);
  gh.factory<_i6.GetMovieSearchResult>(
      () => _i6.GetMovieSearchResult(get<_i4.IMovieRepository>()));
  gh.factory<_i7.SearchBlocBloc>(
      () => _i7.SearchBlocBloc(get<_i6.GetMovieSearchResult>()));
  return get;
}
