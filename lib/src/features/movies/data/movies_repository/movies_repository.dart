import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omdb_movies/src/api/movies_api.dart';
import 'package:omdb_movies/src/constants/duration.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../env/env.dart';
import '../../domain/omdb_movie/omdb_movie.dart';
import '../../domain/omdb_movies_response/omdb_movies_response.dart';
import '../movies_exceptions.dart';

part 'movies_repository.g.dart';

typedef MoviesQueryData = ({String query, int page});

enum PlotType {
  short('short'),
  full('full');

  const PlotType(this.value);

  final String value;
}

abstract class MoviesRepository {
  Future<OMDBMoviesResponse> getMovies({required MoviesQueryData queryData});

  Future<OMDBMovie> getMovie({required String movieId, PlotType? plotType});
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

      final error = response.data['Error'] as String?;
      if (error != null) {
        switch (error) {
          case 'Incorrect IMDb ID.':
            throw IncorrectIdException();
          case 'Movie not found!':
            throw NotFoundException();
          case 'The offset specified in a OFFSET clause may not be negative.':
            throw OffsetException();
        }
      }

      return builder(response.data);
    } on DioException catch (e) {
      switch (e.response?.statusCode) {
        case 401:
          throw InvalidApiKeyException();
        default:
          throw UnknownException();
      }
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
    PlotType? plotType,
    CancelToken? cancelToken,
  }) => _getData(
    uri: api.movie(movieId: movieId, plotType: plotType),
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
  ref.onDispose(() {
    cancelToken.cancel();
    timer?.cancel();
  });
  ref.onCancel(() {
    timer = Timer(AppDuration.providerCacheDuration, () {
      link.close();
    });
  });
  ref.onResume(() {
    timer?.cancel();
  });
  final moviesRepository = ref.read(moviesRepositoryProvider);
  return await moviesRepository.getMovies(
    queryData: queryData,
    cancelToken: cancelToken,
  );
}

@riverpod
Future<OMDBMovie> getMovie(
  Ref ref, {
  required String movieId,
  required PlotType? plotType,
}) async {
  final link = ref.keepAlive();
  Timer? timer;
  final cancelToken = CancelToken();
  ref.onDispose(() {
    timer?.cancel();
    cancelToken.cancel();
  });
  ref.onCancel(() {
    timer = Timer(AppDuration.providerCacheDuration, () {
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
