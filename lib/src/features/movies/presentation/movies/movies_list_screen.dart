import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omdb_movies/src/features/movies/presentation/movies/movies_grid.dart';
import 'package:omdb_movies/src/localization/string_hardcoded.dart';
import '../../../../constants/sizes.dart';
import 'movies_search_bar.dart';

class MoviesListScreen extends ConsumerWidget {

  const MoviesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
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
              child: const MoviesGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
