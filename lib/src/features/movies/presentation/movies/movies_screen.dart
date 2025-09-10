import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:omdb_movies/src/features/movies/domain/omdb_movies_response.dart';
import 'package:omdb_movies/src/localization/string_hardcoded.dart';

import '../../../../routing/app_router.dart';
import '../../../../utils/constants/sizes.dart';
import '../../data/movies_repository.dart';
import '../../domain/omdb_movie.dart';
import 'movie_list_tile.dart';
import 'movie_list_tile_shimmer.dart';
import 'movies_search_bar.dart';
import 'movies_search_query_notifier.dart';

class MoviesScreen extends ConsumerWidget {
  static const pageSize = 10;

  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final query = ref.watch(moviesSearchQueryNotifierProvider);
    final responseAsync = ref.watch(
      getMoviesProvider(queryData: (page: 1, query: query)),
    );
    final totalResults = responseAsync.value?.searchTotalResults();
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSizes.md),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
              child: Text(
                'Movies'.hardcoded,
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            const MoviesSearchBar(),
            Expanded(
              child: GridView.builder(
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
                        onTap: () => _onMovieListTileTap(context,movie),
                      );
                    },
                    error: (err, stack) => const SizedBox(),
                    loading: () => const MovieListTileShimmer(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onMovieListTileTap(BuildContext context,OMDBMovie movie){
    context.goNamed(
      AppRoute.movie.name,
      pathParameters: {
        'movie_id': movie.imdbId ?? '',
      },
    );
  }
}
