import 'package:flutter/material.dart';
import 'package:flutter_playground/app/extensions/context_extension.dart';
import 'package:flutter_playground/movie_wiki/domain/entities/movie_thumbnail.dart';

class MovieThumbnailRowWidget extends StatelessWidget {
  final MovieThumbnail movieThumbnail;
  const MovieThumbnailRowWidget({Key? key, required this.movieThumbnail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image(
              image: NetworkImage(movieThumbnail.poster),
              fit: BoxFit.contain,
            ),
          ),
        ),
        // SizedBox(height: 12),
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${movieThumbnail.title} (${movieThumbnail.year})',
                  style: context.textTheme.titleSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
                // Text(
                //   movieThumbnail.year.toUpperCase(),
                //   style: context.textTheme.titleSmall,
                // ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.movie_outlined),
                    SizedBox(width: 8),
                    Text(
                      movieThumbnail.type.toUpperCase(),
                      style: context.textTheme.titleSmall,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
