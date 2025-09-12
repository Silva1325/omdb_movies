import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/movies/presentation/movie_details/movie_details_screen.dart';
import '../features/movies/presentation/movies/movies_list_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_router.g.dart';

enum AppRoute { movies, movie }

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref){
  return GoRouter(
    initialLocation: '/movies',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/movies',
        name: AppRoute.movies.name,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: MoviesListScreen()
        ),
        routes: [
          GoRoute(
            path: '/:movie_id',
            name: AppRoute.movie.name,
            pageBuilder: (context, state) =>
              NoTransitionPage(
                key: state.pageKey,
                child: MovieDetailsScreen(movieId: state.pathParameters['movie_id'] ?? '',)
              )
          ),
        ]
      ),
    ],
  );
}