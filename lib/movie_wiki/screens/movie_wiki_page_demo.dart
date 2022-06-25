import 'package:flutter/material.dart';
import 'package:flutter_playground/app/extensions/context_extension.dart';
import 'package:flutter_playground/app/resources/r.dart';
import 'package:flutter_playground/movie_wiki/bloc/bloc/search_bloc_bloc.dart';
import 'package:flutter_playground/movie_wiki/screens/pages/movie_wiki_home.dart';

class MovieWikiPageDemo extends StatelessWidget {
  const MovieWikiPageDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        brightness: Brightness.dark,
        backgroundColor: R.colors.movieBlack,
        scaffoldBackgroundColor: R.colors.movieBlack,
        primaryColor: R.colors.movieRed,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          foregroundColor: MaterialStateProperty.all(
            R.colors.movieRed,
          ),
          backgroundColor: MaterialStateProperty.all(
            R.colors.movieRed.withOpacity(0.2),
          ),
        )),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: R.colors.darkGray,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          fillColor: R.colors.movieGray.withOpacity(0.2),
          focusColor: R.colors.movieRed.withOpacity(0.2),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 14),
          // constraints: BoxConstraints(minHeight: 56),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: R.colors.movieGray.withOpacity(0.2), width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: R.colors.movieRed, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          // focusColor: R.colors.movieRed.withOpacity(0.2)),
        ),
      ),
      child: Scaffold(
        body: SafeArea(
          child: MovieWikiHomePage(),
        ),
      ),
    );
  }
}
