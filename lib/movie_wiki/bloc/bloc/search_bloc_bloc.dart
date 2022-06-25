import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_playground/movie_wiki/domain/entities/movie_search_result.dart';
import 'package:flutter_playground/movie_wiki/domain/usecases/get_movie_search_result.dart';
import 'package:injectable/injectable.dart';

part 'search_bloc_event.dart';
part 'search_bloc_state.dart';

@injectable
class SearchBlocBloc extends Bloc<SearchBlocEvent, SearchBlocState> {
  final GetMovieSearchResult _getMovieSearchResult;

  SearchBlocBloc(this._getMovieSearchResult) : super(SearchBlocInitial()) {
    on<SearchBlocEventSearch>((event, emit) async {
      emit(SearchBlocLoading());

      final result = await _getMovieSearchResult(event.searchParams);
      result.fold((l) => emit(SearchBlocError(l.toString())),
          (r) => emit(SearchBlocLoaded(r)));
    });
  }
}
