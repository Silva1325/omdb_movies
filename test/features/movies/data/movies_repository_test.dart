
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:omdb_movies/src/api/movies_api.dart';
import 'package:omdb_movies/src/features/movies/data/movies_repository/movies_repository.dart';
import 'package:omdb_movies/src/features/movies/domain/omdb_movie/omdb_movie.dart';
import 'movies_data.dart';
import '../../../mocks.dart';

void main() {

  final  interstellarJson = MoviesData.interstellarJson();
  final String movieId = interstellarJson['imdbID'].toString();
  final PlotType plotTypeShort = PlotType.short;

  test('getMovie() returns movie, success', () async {

    final mockHttpClient = MockDioClient();
    final api = MoviesAPI('apiKey');
    final moviesRepository = OMDBMoviesRepository(
      client: mockHttpClient,
      api: api,
    );

    final uri = api.movie(movieId: movieId, plotType: plotTypeShort);

    when(() => mockHttpClient.getUri(uri)).thenAnswer(
      (_) => Future.value(
        Response(
          data: interstellarJson,
          statusCode: 200,
          requestOptions: RequestOptions(path: uri.toString()),
        ),
      ),
    );

    final movie = await moviesRepository.getMovie(
      movieId: movieId,
      plotType: plotTypeShort,
    );

    expect(movie, OMDBMovie.fromJson(interstellarJson));
  });
}
