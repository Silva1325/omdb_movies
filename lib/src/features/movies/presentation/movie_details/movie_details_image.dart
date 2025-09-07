import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omdb_movies/src/features/movies/domain/omdb_movie.dart';
import '../../../../utils/constants/sizes.dart';

class MovieDetailsImage extends StatelessWidget {
  final OMDBMovie movie;

  const MovieDetailsImage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Stack(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height / 2,
                  imageUrl: movie.poster ?? '',
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) =>
                      Container(color: theme.colorScheme.surfaceContainer),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height / 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.8),
                        Colors.black.withValues(alpha: 0.6),
                        Colors.black.withValues(alpha: 0.3),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.3, 0.6, 1.0],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: AppSizes.md,
              left: AppSizes.md,
              right: AppSizes.md,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title ?? '',
                    maxLines: 2,
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  Row(
                    children: [
                      Chip(
                        avatar: Icon(Icons.star, color: Colors.yellow),
                        label: Text(movie.imdbRating ?? ''),
                      ),
                      SizedBox(width: AppSizes.sm),
                      Chip(
                        avatar: Icon(Icons.calendar_month),
                        label: Text(movie.year ?? ''),
                      ),
                      SizedBox(width: AppSizes.sm),
                      Chip(
                        avatar: Icon(Icons.access_time_outlined),
                        label: Text(movie.runtime ?? ''),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left, color: theme.colorScheme.primary),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                theme.colorScheme.surface,
              ),
            ),
            onPressed: () => context.pop(),
          ),
        ),
      ],
    );
  }
}
