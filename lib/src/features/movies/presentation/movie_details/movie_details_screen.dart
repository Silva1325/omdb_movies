import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omdb_movies/src/features/movies/presentation/movie_details/movie_details_info_shimmer.dart';
import '../../data/movies_repository.dart';
import 'movie_details_info.dart';

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
          return MovieDetailsInfo(movie: movie);
        },
        error: (err, stack) => const SizedBox(),
        loading: () => const MovieDetailsInfoShimmer(),
      ),
    );
  }
}
