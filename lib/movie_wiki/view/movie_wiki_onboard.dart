import 'package:flutter/material.dart';
import 'package:flutter_playground/app/extensions/context_extension.dart';
import 'package:flutter_playground/app/resources/r.dart';
import 'dart:math' as math;

import 'package:go_router/go_router.dart';

class MovieWikiOnboard extends StatelessWidget {
  const MovieWikiOnboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.dark,
      body: Stack(
        alignment: Alignment.bottomCenter,
        fit: StackFit.expand,
        children: [
          //TODO: must has animation, seperated statefull widget and show static image until network images are reachable
          Transform.scale(
            scale: 1.6,
            child: Transform.rotate(
              angle: math.pi / 10,
              child: Image(
                image: AssetImage(R.images.movie_wiki_background),
                fit: BoxFit.contain,
                // fit: BoxFit.fitWidth,
              ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage(R.images.dune_poster),
              // ),
              gradient: LinearGradient(
                colors: [
                  R.colors.black.withOpacity(0),
                  R.colors.black.withOpacity(0.9),
                ],
                tileMode: TileMode.clamp,
                stops: [0.1, 0.8],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Movie Wiki',
                      style: context.textTheme.headlineLarge
                          ?.copyWith(color: R.colors.white, fontSize: 48),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'The best movie streaming app of the century to make your days great!',
                      style: context.textTheme.caption
                          ?.copyWith(color: R.colors.gray, fontSize: 24),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    ElevatedButton(
                      style: context.theme.elevatedButtonTheme.style?.copyWith(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: () => context.go('/omdb'),
                      child: Text('Get Started'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
