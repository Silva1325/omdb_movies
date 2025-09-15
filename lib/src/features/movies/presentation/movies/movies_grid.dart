import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:omdb_movies/src/features/movies/domain/omdb_movies_response/omdb_movies_response.dart';
import '../../../../routing/app_router.dart';
import '../../../../constants/sizes.dart';
import '../../data/movies_repository/movies_repository.dart';
import '../../domain/omdb_movie/omdb_movie.dart';
import 'movie_list_tile.dart';
import 'movie_list_tile_shimmer.dart';
import 'movies_search_query_notifier/movies_search_query_notifier.dart';

class MoviesGrid extends ConsumerWidget {
  static const pageSize = 10;

  const MoviesGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(moviesSearchQueryNotifierProvider);
    final responseAsync = ref.watch(
      getMoviesProvider(queryData: (page: 1, query: query)),
    );
    final totalResults = responseAsync.value?.searchTotalResults();
    return GridView.builder(
      key: ValueKey(query),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppSizes.md,
        crossAxisSpacing: AppSizes.md,
        mainAxisExtent: 250,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.lg,
        vertical: AppSizes.sm,
      ),
      itemCount: totalResults,
      itemBuilder: (context, index) {
        final page = index ~/ pageSize + 1;
        final indexInPage = index % pageSize;
        final responseAsync = ref.watch(
          getMoviesProvider(queryData: (page: page, query: query)),
        );
        return responseAsync.when(
          data: (response) {
            if (indexInPage >= response.search!.length) {
              return null;
            }
            final movie = response.search![indexInPage];
            return MovieListTile(
              movie: movie,
              onTap: () => _onMovieListTileTap(context, movie),
            );
          },
          error: (err, stack) => const SizedBox(),
          loading: () => const MovieListTileShimmer(),
        );
      },
    );
  }

  void _onMovieListTileTap(BuildContext context, OMDBMovie movie) {
    context.goNamed(
      AppRoute.movie.name,
      pathParameters: {'movie_id': movie.imdbId ?? ''},
    );
  }
}
