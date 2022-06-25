import 'package:flutter/material.dart';
import 'package:flutter_playground/app/extensions/context_extension.dart';
import 'package:flutter_playground/app/resources/r.dart';
import 'package:flutter_playground/movie_wiki/domain/entities/movie_thumbnail.dart';

class MovieThumbnailStackedWidget extends StatelessWidget {
  final MovieThumbnail movieThumbnail;
  const MovieThumbnailStackedWidget({Key? key, required this.movieThumbnail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: NetworkImage(movieThumbnail.poster),
            fit: BoxFit.contain,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: DecoratedBox(
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${movieThumbnail.title}',
                      style: context.textTheme.titleSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                    SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Icon(Icons.movie_outlined),
                        // SizedBox(width: 8),
                        Text(
                          movieThumbnail.type,
                          style: context.textTheme.titleSmall,
                        ),
                        Spacer(),
                        Text(
                          movieThumbnail.year.toUpperCase(),
                          style: context.textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
