part of 'search_bloc_bloc.dart';

abstract class SearchBlocState extends Equatable {
  const SearchBlocState();

  @override
  List<Object> get props => [];
}

class SearchBlocInitial extends SearchBlocState {}

class SearchBlocLoading extends SearchBlocState {}

class SearchBlocLoaded extends SearchBlocState {
  final MovieSearchResult searchResult;

  SearchBlocLoaded(this.searchResult);

  @override
  List<Object> get props => [searchResult];
}

class SearchBlocError extends SearchBlocState {
  final String errorMessage;

  SearchBlocError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
