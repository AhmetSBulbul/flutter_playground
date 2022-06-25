import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/app/extensions/context_extension.dart';
import 'package:flutter_playground/app/resources/r.dart';
import 'package:flutter_playground/injection.dart';
import 'package:flutter_playground/movie_wiki/bloc/bloc/search_bloc_bloc.dart';
import 'package:flutter_playground/movie_wiki/domain/usecases/get_movie_search_result.dart';
import 'package:flutter_playground/movie_wiki/widgets/movie_thumbnail_widget.dart';

class MovieWikiHomePage extends StatelessWidget {
  MovieWikiHomePage({Key? key}) : super(key: key);
  final _searchBloc = locator<SearchBlocBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBlocBloc>(
      create: (BuildContext context) => _searchBloc,
      // create: (context) => locator<SearchBlocBloc>(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: TextField(
                  // showCursor: false,
                  cursorColor: R.colors.movieRed,
                  cursorRadius: Radius.circular(5),
                  // onSubmitted: (val) {
                  //   locator<SearchBlocBloc>()
                  //       .add(SearchBlocEventSearch(ParamsMovieSearch(val)));
                  // },
                )),
                SizedBox(
                  width: 12,
                ),
                ElevatedButton(
                  child: Icon(Icons.search),
                  style: context.theme.elevatedButtonTheme.style?.copyWith(
                    minimumSize: MaterialStateProperty.all(
                      Size(56, 56),
                    ),
                  ),
                  onPressed: () {
                    print('hey');
                    _searchBloc.add(
                        SearchBlocEventSearch(ParamsMovieSearch('sunshine')));

                    // locator<SearchBlocBloc>(instanceName: 'searchBloc').add(
                    //     SearchBlocEventSearch(ParamsMovieSearch('sunshine')));
                    // locator<SearchBlocBloc>().add(
                    //     SearchBlocEventSearch(ParamsMovieSearch('sunshine')));
                  },
                ),
              ],
            ),
          ),
          Expanded(
              child: BlocBuilder<SearchBlocBloc, SearchBlocState>(
            // bloc: locator.get<SearchBlocBloc>(),
            // bloc: BlocProvider.of<SearchBlocBloc>(context),
            // bloc: locator.get<SearchBlocBloc>(),
            // bloc: locator<SearchBlocBloc>(instanceName: 'searchBloc'),
            bloc: _searchBloc,
            builder: (context, state) {
              if (state is SearchBlocInitial) {
                return Center(
                  child: ElevatedButton(
                    child: Text('Search'),
                    onPressed: () => context.read<SearchBlocBloc>().add(
                        SearchBlocEventSearch(ParamsMovieSearch('sunshine'))),
                  ),
                );
              } else if (state is SearchBlocLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else if (state is SearchBlocLoaded) {
                return GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.5,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12),
                  // childAspectRatio: 1.0,

                  children: state.searchResult.search.map((e) {
                    return Image.network(e.poster);
                  }).toList(),
                );
              } else if (state is SearchBlocError) {
                return Center(
                  child: Text('Error'),
                );
              } else {
                return Center(
                  child: Text('Unknown'),
                );
              }
            },
          ))
          // Row(mainAxisSize: MainAxisSize.min, children: [TextField()])
        ],
      ),
    );
  }
}
