import 'package:flutter/material.dart';
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
  static const List<Widget> _movieWikiAppPages = [
    Text(
      'Index 0: Home',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Wiki'),
      ),
      body: Center(
        child: _movieWikiAppPages.elementAt(_currentPage.state),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'My List',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Watched',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Roulette',
              backgroundColor: Colors.black),
        ],
        currentIndex: _currentPage.state,
        selectedItemColor: Colors.white,
        onTap: (index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    context.go('/movie_wiki_app/$index');
  }
}
