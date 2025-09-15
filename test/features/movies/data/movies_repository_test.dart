@Timeout(duration: Duration(milliseconds: 500))
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:omdb_movies/src/api/movies_api.dart';
import 'package:omdb_movies/src/features/movies/data/movies_repository/movies_repository.dart';
import 'package:omdb_movies/src/features/movies/data/movies_exceptions.dart';
import 'package:omdb_movies/src/features/movies/domain/omdb_movie/omdb_movie.dart';
import 'package:omdb_movies/src/features/movies/domain/omdb_movies_response/omdb_movies_response.dart';
import '../../../mocks.dart';
import 'movies_data.dart';

void main() {
  late MockDioClient mockDioClient;
  late MoviesAPI moviesAPI;
  late OMDBMoviesRepository moviesRepository;

  final String emptyMovieId = '';
  final String invalidMovieId = 'invalid-movie-id';
  final PlotType plotTypeFull = PlotType.full;
  final PlotType plotTypeShort = PlotType.short;

  setUp(() {
    mockDioClient = MockDioClient();
    moviesAPI = MoviesAPI('apiKey');
    moviesRepository = OMDBMoviesRepository(
      client: mockDioClient,
      api: moviesAPI,
    );
  });

  group('getMovies()', () {
    test(
      '''
      Given an invalid query('') and a valid page number(1)
      When the API responds with "Incorrect IMDb ID."
      Then it should throw a IncorrectIdException
      ''',
      () async {
        final queryData = (query: emptyMovieId, page: 1);

        final uri = moviesAPI.movies(queryData: queryData);

        when(
          () =>
              mockDioClient.getUri(uri, cancelToken: any(named: 'cancelToken')),
        ).thenAnswer(
          (_) => Future.value(
            Response(
              data: {"Response": "False", "Error": "Incorrect IMDb ID."},
              statusCode: 200,
              requestOptions: RequestOptions(path: uri.toString()),
            ),
          ),
        );

        expect(
          () => moviesRepository.getMovies(queryData: queryData),
          throwsA(isA<IncorrectIdException>()),
        );
      },
    );

    test(
      '''
      Given a valid query and page number(1)
      When the API returns a valid movies list response
      Then it should return an OMDBMoviesResponse successfully
      ''',
      () async {
        final moviesJson = MoviesData.moviesListJson();
        final query = MoviesData.inceptionMovieJson()['Title'].toString();
        final queryData = (query: query, page: 1);

        final uri = moviesAPI.movies(queryData: queryData);

        when(
          () =>
              mockDioClient.getUri(uri, cancelToken: any(named: 'cancelToken')),
        ).thenAnswer(
          (_) => Future.value(
            Response(
              data: moviesJson,
              statusCode: 200,
              requestOptions: RequestOptions(path: uri.toString()),
            ),
          ),
        );

        final movies = await moviesRepository.getMovies(queryData: queryData);

        expect(movies, OMDBMoviesResponse.fromJson(moviesJson));
      },
    );

    test(
      '''
      Given a valid query and page number(2)
      When the API returns a valid movies list response
      Then it should return an OMDBMoviesResponse successfully
      ''',
      () async {
        final moviesJson = MoviesData.moviesListJson();
        final query = MoviesData.inceptionMovieJson()['Title'].toString();
        final queryData = (query: query, page: 2);

        final uri = moviesAPI.movies(queryData: queryData);

        when(
          () =>
              mockDioClient.getUri(uri, cancelToken: any(named: 'cancelToken')),
        ).thenAnswer(
          (_) => Future.value(
            Response(
              data: moviesJson,
              statusCode: 200,
              requestOptions: RequestOptions(path: uri.toString()),
            ),
          ),
        );

        final movies = await moviesRepository.getMovies(queryData: queryData);

        expect(movies, OMDBMoviesResponse.fromJson(moviesJson));
      },
    );

    test(
      '''
      Given an invalid query and a valid page number(1)
      When the API responds with "Movie not found!"
      Then it should throw a NotFoundException
      ''',
      () async {
        final queryData = (query: invalidMovieId, page: 1);

        final uri = moviesAPI.movies(queryData: queryData);

        when(
          () =>
              mockDioClient.getUri(uri, cancelToken: any(named: 'cancelToken')),
        ).thenAnswer(
          (_) => Future.value(
            Response(
              data: {"Response": "False", "Error": "Movie not found!"},
              statusCode: 200,
              requestOptions: RequestOptions(path: uri.toString()),
            ),
          ),
        );

        expect(
          () => moviesRepository.getMovies(queryData: queryData),
          throwsA(isA<NotFoundException>()),
        );
      },
    );

    test(
      '''
      Given a valid query and a negative page number(-1)
      When the API responds with "The offset specified in a OFFSET clause may not be negative."
      Then it should throw a OffsetException
      ''',
      () async {
        final query = MoviesData.inceptionMovieJson()['Title'].toString();
        final queryData = (query: query, page: -1);

        final uri = moviesAPI.movies(queryData: queryData);

        when(
          () =>
              mockDioClient.getUri(uri, cancelToken: any(named: 'cancelToken')),
        ).thenAnswer(
          (_) => Future.value(
            Response(
              data: {
                "Response": "False",
                "Error":
                    "The offset specified in a OFFSET clause may not be negative.",
              },
              statusCode: 200,
              requestOptions: RequestOptions(path: uri.toString()),
            ),
          ),
        );

        expect(
          () => moviesRepository.getMovies(queryData: queryData),
          throwsA(isA<OffsetException>()),
        );
      },
    );

    test(
      '''
      Given a valid query and an invalid page number(0)
      When the API responds with "The offset specified in a OFFSET clause may not be negative."
      Then it should throw a OffsetException
      ''',
      () async {
        final query = MoviesData.inceptionMovieJson()['Title'].toString();
        final queryData = (query: query, page: 0);

        final uri = moviesAPI.movies(queryData: queryData);

        when(
          () =>
              mockDioClient.getUri(uri, cancelToken: any(named: 'cancelToken')),
        ).thenAnswer(
          (_) => Future.value(
            Response(
              data: {
                "Response": "False",
                "Error":
                    "The offset specified in a OFFSET clause may not be negative.",
              },
              statusCode: 200,
              requestOptions: RequestOptions(path: uri.toString()),
            ),
          ),
        );

        expect(
          () => moviesRepository.getMovies(queryData: queryData),
          throwsA(isA<OffsetException>()),
        );
      },
    );

    test(
      '''
      Given a valid query and a positive invalid page number(99999999)
      When the API responds with "Movie not found!"
      Then it should throw a NotFoundException
      ''',
      () async {
        final query = MoviesData.inceptionMovieJson()['Title'].toString();
        final queryData = (query: query, page: 99999999);

        final uri = moviesAPI.movies(queryData: queryData);

        when(
          () =>
              mockDioClient.getUri(uri, cancelToken: any(named: 'cancelToken')),
        ).thenAnswer(
          (_) => Future.value(
            Response(
              data: {"Response": "False", "Error": "Movie not found!"},
              statusCode: 200,
              requestOptions: RequestOptions(path: uri.toString()),
            ),
          ),
        );

        expect(
          () => moviesRepository.getMovies(queryData: queryData),
          throwsA(isA<NotFoundException>()),
        );
      },
    );

    test(
      '''
      Given a valid query and page number(1)
      When the API responds with status 401
      Then it should throw an InvalidApiKeyException
      ''',
      () async {
        final query = MoviesData.inceptionMovieJson()['Title'].toString();
        final queryData = (query: query, page: 1);

        final uri = moviesAPI.movies(queryData: queryData);

        when(
          () =>
              mockDioClient.getUri(uri, cancelToken: any(named: 'cancelToken')),
        ).thenThrow(
          DioException(
            response: Response(
              statusCode: 401,
              requestOptions: RequestOptions(path: uri.toString()),
            ),
            requestOptions: RequestOptions(path: uri.toString()),
          ),
        );

        expect(
          () => moviesRepository.getMovies(queryData: queryData),
          throwsA(isA<InvalidApiKeyException>()),
        );
      },
    );

    test(
      '''
      Given a valid query and page number(1)
      When the API responds with status 500
      Then it should throw an UnknownException
      ''',
      () async {
        final query = MoviesData.inceptionMovieJson()['Title'].toString();
        final queryData = (query: query, page: 1);

        final uri = moviesAPI.movies(queryData: queryData);

        when(
          () =>
              mockDioClient.getUri(uri, cancelToken: any(named: 'cancelToken')),
        ).thenThrow(
          DioException(
            response: Response(
              statusCode: 500,
              requestOptions: RequestOptions(path: uri.toString()),
            ),
            requestOptions: RequestOptions(path: uri.toString()),
          ),
        );

        expect(
          () => moviesRepository.getMovies(queryData: queryData),
          throwsA(isA<UnknownException>()),
        );
      },
    );
  });

  group('getMovie()', () {
    test(
      '''
      Given a valid movieId
      When the API returns a valid movie response
      Then it should return an OMDBMovie successfully
      ''',
      () async {
        final ironManMovieJson = MoviesData.ironManMovieJson();
        final String movieId = ironManMovieJson['imdbID'].toString();

        final uri = moviesAPI.movie(movieId: movieId);

        when(
          () =>
              mockDioClient.getUri(uri, cancelToken: any(named: 'cancelToken')),
        ).thenAnswer(
          (_) => Future.value(
            Response(
              data: ironManMovieJson,
              statusCode: 200,
              requestOptions: RequestOptions(path: uri.toString()),
            ),
          ),
        );

        final ironManMovie = await moviesRepository.getMovie(movieId: movieId);

        expect(ironManMovie, OMDBMovie.fromJson(ironManMovieJson));
      },
    );

    test(
      '''
      Given a valid movieId and PlotType.short
      When the API returns a valid movie response
      Then it should return an OMDBMovie successfully
      ''',
      () async {
        final ironManMovieJson = MoviesData.ironManMovieJson();
        final String movieId = ironManMovieJson['imdbID'].toString();

        final uri = moviesAPI.movie(movieId: movieId, plotType: plotTypeShort);

        when(
          () =>
              mockDioClient.getUri(uri, cancelToken: any(named: 'cancelToken')),
        ).thenAnswer(
          (_) => Future.value(
            Response(
              data: ironManMovieJson,
              statusCode: 200,
              requestOptions: RequestOptions(path: uri.toString()),
            ),
          ),
        );

        final ironManMovie = await moviesRepository.getMovie(
          movieId: movieId,
          plotType: plotTypeShort,
        );

        expect(ironManMovie, OMDBMovie.fromJson(ironManMovieJson));
      },
    );

    test(
      '''
      Given a valid movieId and PlotType.full
      When the API returns a valid movie response
      Then it should return an OMDBMovie successfully
      ''',
      () async {
        final interstellarMovieJson = MoviesData.interstellarMovieJson();
        final String movieId = interstellarMovieJson['imdbID'].toString();

        final uri = moviesAPI.movie(movieId: movieId, plotType: plotTypeFull);

        when(
          () =>
              mockDioClient.getUri(uri, cancelToken: any(named: 'cancelToken')),
        ).thenAnswer(
          (_) => Future.value(
            Response(
              data: interstellarMovieJson,
              statusCode: 200,
              requestOptions: RequestOptions(path: uri.toString()),
            ),
          ),
        );

        final interstellarMovie = await moviesRepository.getMovie(
          movieId: movieId,
          plotType: plotTypeFull,
        );

        expect(interstellarMovie, OMDBMovie.fromJson(interstellarMovieJson));
      },
    );

    test(
      '''
      Given a non-existent movieId
      When the API responds with "Movie not found!"
      Then it should throw a NotFoundException
      ''',
      () async {
        final uri = moviesAPI.movie(movieId: invalidMovieId);

        when(
          () =>
              mockDioClient.getUri(uri, cancelToken: any(named: 'cancelToken')),
        ).thenAnswer(
          (_) => Future.value(
            Response(
              data: {"Response": "False", "Error": "Movie not found!"},
              statusCode: 200,
              requestOptions: RequestOptions(path: uri.toString()),
            ),
          ),
        );

        expect(
          () => moviesRepository.getMovie(movieId: invalidMovieId),
          throwsA(isA<NotFoundException>()),
        );
      },
    );

    test(
      '''
      Given a non-existent movieId and PlotType.short
      When the API responds with "Movie not found!"
      Then it should throw a NotFoundException
      ''',
      () async {
        final uri = moviesAPI.movie(
          movieId: invalidMovieId,
          plotType: plotTypeShort,
        );

        when(
          () =>
              mockDioClient.getUri(uri, cancelToken: any(named: 'cancelToken')),
        ).thenAnswer(
          (_) => Future.value(
            Response(
              data: {"Response": "False", "Error": "Movie not found!"},
              statusCode: 200,
              requestOptions: RequestOptions(path: uri.toString()),
            ),
          ),
        );

        expect(
          () => moviesRepository.getMovie(
            movieId: invalidMovieId,
            plotType: plotTypeShort,
          ),
          throwsA(isA<NotFoundException>()),
        );
      },
    );

    test(
      '''
      Given a non-existent movieId and PlotType.full
      When the API responds with "Movie not found!"
      Then it should throw a NotFoundException
      ''',
      () async {
        final uri = moviesAPI.movie(
          movieId: invalidMovieId,
          plotType: plotTypeFull,
        );

        when(
          () =>
              mockDioClient.getUri(uri, cancelToken: any(named: 'cancelToken')),
        ).thenAnswer(
          (_) => Future.value(
            Response(
              data: {"Response": "False", "Error": "Movie not found!"},
              statusCode: 200,
              requestOptions: RequestOptions(path: uri.toString()),
            ),
          ),
        );

        expect(
          () => moviesRepository.getMovie(
            movieId: invalidMovieId,
            plotType: plotTypeFull,
          ),
          throwsA(isA<NotFoundException>()),
        );
      },
    );

    test(
      '''
      Given a valid movieId
      When the API responds with status 401
      Then it should throw an InvalidApiKeyException
      ''',
      () async {
        final interstellarMovieJson = MoviesData.interstellarMovieJson();
        final String movieId = interstellarMovieJson['imdbID'].toString();

        final uri = moviesAPI.movie(movieId: movieId);

        when(
          () =>
              mockDioClient.getUri(uri, cancelToken: any(named: 'cancelToken')),
        ).thenThrow(
          DioException(
            response: Response(
              statusCode: 401,
              requestOptions: RequestOptions(path: uri.toString()),
            ),
            requestOptions: RequestOptions(path: uri.toString()),
          ),
        );

        expect(
          () => moviesRepository.getMovie(movieId: movieId),
          throwsA(isA<InvalidApiKeyException>()),
        );
      },
    );

    test(
      '''
      Given a valid movieId
      When the API responds with status 500
      Then it should throw an UnknownException
      ''',
      () async {
        final interstellarMovieJson = MoviesData.interstellarMovieJson();
        final String movieId = interstellarMovieJson['imdbID'].toString();

        final uri = moviesAPI.movie(movieId: movieId);

        when(
          () =>
              mockDioClient.getUri(uri, cancelToken: any(named: 'cancelToken')),
        ).thenThrow(
          DioException(
            response: Response(
              statusCode: 500,
              requestOptions: RequestOptions(path: uri.toString()),
            ),
            requestOptions: RequestOptions(path: uri.toString()),
          ),
        );

        expect(
          () => moviesRepository.getMovie(movieId: movieId),
          throwsA(isA<UnknownException>()),
        );
      },
    );
  });
}
