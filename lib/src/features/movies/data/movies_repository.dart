import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omdb_movies/src/api/movies_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../env/env.dart';
import '../domain/omdb_movie.dart';
import '../domain/omdb_movies_response.dart';
import 'movies_exceptions.dart';

part 'movies_repository.g.dart';

typedef MoviesQueryData = ({String query, int page});

enum PlotType {
  short('short'),
  full('full');

  const PlotType(this.value);

  final String value;
}

abstract class MoviesRepository {
  Future<OMDBMoviesResponse> getMovies({
    required MoviesQueryData queryData,
  });

  Future<OMDBMovie> getMovie({
    required String movieId,
    required PlotType plotType,
  });
}

class OMDBMoviesRepository implements MoviesRepository {
  final Dio client;
  final MoviesAPI api;

  const OMDBMoviesRepository({required this.client, required this.api});

  Future<T> _getData<T>({
    required Uri uri,
    required CancelToken? cancelToken,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final response = await client.getUri(uri, cancelToken: cancelToken);
      switch (response.statusCode) {
        case 200:
          return builder(response.data);
        case 404:
          throw NotFoundException();
        case 401:
          throw InvalidApiKeyException();
        default:
          throw UnknownException();
      }
    } catch (e) {
      throw UnknownException();
    }
  }

  @override
  Future<OMDBMoviesResponse> getMovies({
    required MoviesQueryData queryData,
    CancelToken? cancelToken,
  }) => _getData(
    uri: api.movies(queryData: queryData),
    cancelToken: cancelToken,
    builder: (data) => OMDBMoviesResponse.fromJson(data),
  );

  @override
  Future<OMDBMovie> getMovie({
    required String movieId,
    required PlotType plotType,
    CancelToken? cancelToken,
  }) => _getData(
    uri: api.movies(movieId: movieId, plotType: plotType),
    cancelToken: cancelToken,
    builder: (data) => OMDBMovie.fromJson(data),
  );
}

@riverpod
OMDBMoviesRepository moviesRepository(Ref ref) {
  return OMDBMoviesRepository(client: Dio(), api: MoviesAPI(Env.omdbApiKey));
}

@riverpod
Future<OMDBMoviesResponse> getMovies(
  Ref ref, {
  required MoviesQueryData queryData,
}) async {
  final link = ref.keepAlive();
  Timer? timer;
  CancelToken cancelToken = CancelToken();
  ref.onDispose((){
    cancelToken.cancel();
    timer?.cancel();
  });
  ref.onCancel((){
    timer = Timer(const Duration(seconds: 30), () {
      link.close();
    });
  });
  ref.onResume((){
    timer?.cancel();
  });
  final moviesRepository = ref.read(moviesRepositoryProvider);
  return await moviesRepository.getMovies(
    queryData: queryData,
    cancelToken: null,
  );
}

@riverpod
Future<OMDBMovie> getMovie(
  Ref ref, {
  required String movieId,
  required PlotType plotType,
}) async {
  final link = ref.keepAlive();
  Timer? timer;
  final cancelToken = CancelToken();
  ref.onDispose(() {
    timer?.cancel();
    cancelToken.cancel();
  });
  ref.onCancel(() {
    timer = Timer(const Duration(seconds: 30), () {
      link.close();
    });
  });
  ref.onResume(() {
    timer?.cancel();
  });
  final moviesRepository = ref.read(moviesRepositoryProvider);
  return await moviesRepository.getMovie(
    movieId: movieId,
    plotType: plotType,
    cancelToken: cancelToken,
  );
}
