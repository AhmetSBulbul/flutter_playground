import 'package:flutter/material.dart';
import 'package:flutter_playground/app/extensions/context_extension.dart';
import 'package:flutter_playground/app/resources/r.dart';
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
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: TextField(
                key: Key('movie_wiki_home_field'),
              ))
            ],
          ),
        )
        // Row(mainAxisSize: MainAxisSize.min, children: [TextField()])
      ],
    ),
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
        inputDecorationTheme: context.theme.inputDecorationTheme.copyWith(
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          constraints: BoxConstraints(minHeight: 56),
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
