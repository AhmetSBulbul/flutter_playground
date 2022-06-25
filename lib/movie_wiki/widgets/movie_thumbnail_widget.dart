import 'package:flutter/material.dart';
import 'package:flutter_playground/app/extensions/context_extension.dart';
import 'package:flutter_playground/movie_wiki/domain/entities/movie_thumbnail.dart';

class MovieThumbnailWidget extends StatelessWidget {
  final MovieThumbnail movieThumbnail;
  const MovieThumbnailWidget({Key? key, required this.movieThumbnail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          fit: FlexFit.loose,
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
        )
      ],
    );
  }
}
