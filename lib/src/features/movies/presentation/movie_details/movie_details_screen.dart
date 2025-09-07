
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omdb_movies/src/localization/string_hardcoded.dart';
import '../../../../utils/constants/sizes.dart';
import '../../data/movies_repository.dart';
import 'movie_details_image.dart';

class MovieDetailsScreen extends ConsumerWidget {
  final String movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final responseAsync = ref.watch(
      getMovieProvider(movieId: movieId, plotType: PlotType.full),
    );
    return Scaffold(
      //appBar: AppBar(),
      backgroundColor: theme.colorScheme.surface,
      body: responseAsync.when(
        data: (movie) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieDetailsImage(movie: movie),
                Padding(
                  padding: const EdgeInsets.all(AppSizes.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: AppSizes.sm),
                      Text(
                        'Description'.hardcoded,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: AppSizes.sm),
                      Text(
                        movie.plot ?? '',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: AppSizes.sm),
                      Text(
                        'Actors'.hardcoded,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: AppSizes.sm),
                      Text(
                        movie.actors ?? '',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: AppSizes.sm),
                      Text(
                        'Awards'.hardcoded,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: AppSizes.sm),
                      Text(
                        movie.awards ?? '',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        error: (err, stack) => const SizedBox(),
        loading: () => const SizedBox(),
      ),
    );
  }
}
