import 'package:flutter/material.dart';
import 'package:flutter_playground/app/extensions/context_extension.dart';
import 'package:flutter_playground/app/resources/r.dart';
import 'package:flutter_playground/movie_wiki/screens/pages/movie_wiki_home.dart';
import 'package:go_router/go_router.dart';

enum MovieWikiAppPage {
  home(0),
  myList(1),
  watched(2),
  roulette(3),
  error(-1);

  const MovieWikiAppPage(this.value);

  // Returns page from index
  factory MovieWikiAppPage.fromIndex(int value) {
    return values.firstWhere((e) => e.value == value, orElse: () => error);
  }

  // Returns page from page id parameter
  factory MovieWikiAppPage.fromPid(String pid) {
    return values.firstWhere((e) => e.value.toString() == pid,
        orElse: () => error);
  }
  final int value;

  int get state => value;
}

class MovieWikiAppScreen extends StatefulWidget {
  final MovieWikiAppPage page;
  MovieWikiAppScreen({Key? key, required MovieWikiAppPage currentPage})
      : page = currentPage,
        super(key: key);

  @override
  State<MovieWikiAppScreen> createState() => _MovieWikiAppScreenState();
}

class _MovieWikiAppScreenState extends State<MovieWikiAppScreen> {
  MovieWikiAppPage _currentPage = MovieWikiAppPage.home;
  static List<Widget> _movieWikiAppPages = [
    // Column(
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     Expanded(
    //       child: Row(
    //         children: [TextField()],
    //       ),
    //     )
    //   ],
    // ),
    MovieWikiHomePage(),
    Text(
      'Index 1: My List',
    ),
    Text(
      'Index 2: Watched',
    ),
    Text(
      'Index 3: Roulette',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _currentPage = widget.page;
  }

  @override
  void didUpdateWidget(covariant MovieWikiAppScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _currentPage = widget.page;
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
          {required Icon icon, required String label}) =>
      BottomNavigationBarItem(
        icon: icon,
        label: label,
        backgroundColor: R.colors.dark,
      );

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        brightness: Brightness.dark,
        backgroundColor: R.colors.movieBlack,
        scaffoldBackgroundColor: R.colors.movieBlack,
        primaryColor: R.colors.movieRed,
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.3,
            color: R.colors.dark,
          ),
          bodyText2: TextStyle(fontSize: 16, color: R.colors.lightGray),
          caption: TextStyle(
            fontWeight: FontWeight.w600,
            color: R.colors.lightGray,
            fontSize: 15,
          ),
        ),
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
          iconColor: R.colors.movieRed,
          labelStyle: TextStyle(
            color: R.colors.lightGray,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,

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
        appBar: AppBar(
          title: Text('Movie Wiki'),
        ),
        body: Center(
          child: _movieWikiAppPages.elementAt(_currentPage.state),
        ),
        // floatingActionButton:
        //     FloatingActionButton(child: Icon(Icons.search), onPressed: () {}),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.black,
          unselectedItemColor: R.colors.darkGray,
          type: BottomNavigationBarType.shifting,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),

          unselectedLabelStyle: TextStyle(color: R.colors.darkGray),
          items: <BottomNavigationBarItem>[
            _bottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            _bottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'My List',
            ),
            _bottomNavigationBarItem(
              icon: Icon(Icons.checklist),
              label: 'Watched',
            ),
            _bottomNavigationBarItem(
              icon: Icon(Icons.shuffle_rounded),
              label: 'Roulette',
            ),
          ],
          currentIndex: _currentPage.state,
          selectedItemColor: Colors.red,
          onTap: (index) => _onTap(context, index),
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    context.go('/movie_wiki_app/$index');
  }
}
