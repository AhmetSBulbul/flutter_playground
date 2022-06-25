import 'package:flutter/material.dart';
import 'package:flutter_playground/app/extensions/context_extension.dart';
import 'package:flutter_playground/app/resources/r.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math' as math;

import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Playground Showcase')),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: StaggeredGrid.count(
            crossAxisCount: 5,
            mainAxisSpacing: 18,
            crossAxisSpacing: 18,
            children: [
              HomeShowcaseItem(
                title: 'Movie Wiki',
                path: '/movie_wiki_app/0',
                crossCount: 5,
                mainCount: 3,
                angle: math.pi / 18,
                scale: 2,
                img: R.images.movie_wiki_background,
              ),
              HomeShowcaseItem(
                title: 'Simple Auth UI',
                img: R.images.fruzz_digital_logo,
                path: '/simple_auth',
                crossCount: 3,
                mainCount: 2,
                scale: 1,
                angle: 0,
              )
            ],
          ),
        ));
  }
}

class HomeShowcaseItem extends StatelessWidget {
  const HomeShowcaseItem({
    Key? key,
    required this.title,
    required this.img,
    required this.path,
    required this.crossCount,
    required this.mainCount,
    required this.angle,
    required this.scale,
  }) : super(key: key);
  final String title;
  final String img;
  final String path;
  final int crossCount;
  final int mainCount;
  final double angle;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
        crossAxisCellCount: crossCount,
        mainAxisCellCount: mainCount,
        child: Card(
          clipBehavior: Clip.hardEdge,
          color: R.colors.dark,
          child: InkWell(
              onTap: () => context.go(path),
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  DecoratedBox(
                    position: DecorationPosition.foreground,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter,
                        stops: [0.0, 0.8],
                        colors: [
                          R.colors.dark.withOpacity(1),
                          R.colors.dark.withOpacity(0),
                        ],
                      ),
                    ),
                    child: Transform.rotate(
                      angle: angle,
                      child: Image.asset(
                        img,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12),
                      child: Text(
                        title,
                        style: context.textTheme.caption
                            ?.copyWith(color: R.colors.white, fontSize: 18),
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}
