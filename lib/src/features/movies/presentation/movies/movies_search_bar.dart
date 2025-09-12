import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omdb_movies/src/localization/string_hardcoded.dart';
import '../../../../constants/sizes.dart';
import 'movies_search_query_notifier/movies_search_query_notifier.dart';

class MoviesSearchBar extends ConsumerStatefulWidget {
  const MoviesSearchBar({super.key});

  @override
  ConsumerState<MoviesSearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<MoviesSearchBar> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 90,
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: AppSizes.md,
            horizontal: AppSizes.lg,
          ),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainer,
            borderRadius: const BorderRadius.all(
              Radius.circular(AppSizes.borderRadiusLg),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
            child: Row(
              children: [
                Icon(Icons.search, color: theme.colorScheme.primary),
                const SizedBox(width: 10),
                Expanded(
                  child: Center(
                    child: TextField(
                      controller: _controller,
                      style: TextStyle(color: theme.colorScheme.onSurface),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                        hintText: 'Search movies'.hardcoded,
                        hintStyle: TextStyle(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      onEditingComplete: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      onChanged: (text) => ref
                        .read(moviesSearchQueryNotifierProvider.notifier)
                        .setQuery(text),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
