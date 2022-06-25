part of 'search_bloc_bloc.dart';

abstract class SearchBlocEvent extends Equatable {
  const SearchBlocEvent();

  @override
  List<Object> get props => [];
}

class SearchBlocEventSearch extends SearchBlocEvent {
  final ParamsMovieSearch searchParams;

  SearchBlocEventSearch(this.searchParams);

  @override
  List<Object> get props => [searchParams];
}
