import 'package:flutter/material.dart';
import 'package:flutter_playground/app/extensions/context_extension.dart';
import 'package:flutter_playground/movie_wiki/domain/entities/movie_thumbnail.dart';

class MovieThumbnailWidget extends StatelessWidget {
  final MovieThumbnail movieThumbnail;
  const MovieThumbnailWidget({Key? key, required this.movieThumbnail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image(
            image: NetworkImage(movieThumbnail.poster),
            fit: BoxFit.contain,
          ),
          SizedBox(height: 12),
          Text(
            '${movieThumbnail.title}',
            style: context.textTheme.titleSmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
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
              Spacer(),
              Text(
                movieThumbnail.year.toUpperCase(),
                style: context.textTheme.titleSmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}
