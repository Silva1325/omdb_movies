//ignore: library_annotations
@Timeout(Duration(milliseconds: 500))
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:omdb_movies/src/api/movies_api.dart';
import 'package:omdb_movies/src/constants/duration.dart';
import 'package:omdb_movies/src/features/movies/data/movies_repository/movies_repository.dart';
import 'package:omdb_movies/src/features/movies/data/movies_exceptions.dart';
import 'package:omdb_movies/src/features/movies/domain/omdb_movie/omdb_movie.dart';
import 'package:omdb_movies/src/features/movies/domain/omdb_movies_response/omdb_movies_response.dart';
import '../../../mocks.dart';
import '../../../utils/container_helper.dart';
import 'movies_data.dart';

void main() {
  late MockDioClient mockDioClient;
  late MoviesAPI moviesAPI;
  late OMDBMoviesRepository moviesRepository;
  late MockOMDBMoviesRepository mockMoviesRepository; // Used for provider tests
  late ContainerHelper containerHelper; // Used for provider tests

  final String emptyMovieId = '';
  final String invalidMovieId = 'invalid-movie-id';
  final Map<String, Object?> ironManMovieJson = MoviesData.ironManMovieJson();
  final Map<String, Object?> interstellarMovieJson =
      MoviesData.interstellarMovieJson();
  final PlotType plotTypeFull = PlotType.full;
  final PlotType plotTypeShort = PlotType.short;

  group('getMovies()', () {
    setUp(() {
      mockDioClient = MockDioClient();
      moviesAPI = MoviesAPI('apiKey');
      moviesRepository = OMDBMoviesRepository(
        client: mockDioClient,
        api: moviesAPI,
      );
    });

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

  group('getMovies() provider', () {
    setUp(() {
      containerHelper = ContainerHelper();
      mockMoviesRepository = MockOMDBMoviesRepository();
    });

    test(
      '''
    Given the same query called multiple times
    When the provider is accessed
    Then it should return cached result without calling repository again
    ''',
      () async {
        final query = MoviesData.inceptionMovieJson()['Title'].toString();
        final queryData = (query: query, page: 1);
        final expectedMoviesResponse = OMDBMoviesResponse.fromJson(
          MoviesData.moviesListJson(),
        );

        when(
          () => mockMoviesRepository.getMovies(
            queryData: queryData,
            cancelToken: any(named: 'cancelToken'),
          ),
        ).thenAnswer((_) async => expectedMoviesResponse);

        final container = containerHelper.createContainer(
          overrides: [
            moviesRepositoryProvider.overrideWithValue(mockMoviesRepository),
          ],
        );

        // First call
        final movies1 = await container.read(
          getMoviesProvider(queryData: queryData).future,
        );

        // Second call - should use cache
        final movies2 = await container.read(
          getMoviesProvider(queryData: queryData).future,
        );

        expect(movies1, expectedMoviesResponse);
        expect(movies2, expectedMoviesResponse);

        // Repository should only be called once due to caching
        verify(
          () => mockMoviesRepository.getMovies(
            queryData: queryData,
            cancelToken: any(named: 'cancelToken'),
          ),
        ).called(1);
      },
    );

    test(
      '''
    Given a provider that's no longer being watched
    When 10 seconds pass
    Then the provider should dispose itself
    ''',
      () async {
        final query = MoviesData.inceptionMovieJson()['Title'].toString();
        final queryData = (query: query, page: 1);
        final expectedMoviesResponse = OMDBMoviesResponse.fromJson(
          MoviesData.moviesListJson(),
        );

        when(
          () => mockMoviesRepository.getMovies(
            queryData: queryData,
            cancelToken: any(named: 'cancelToken'),
          ),
        ).thenAnswer((_) async => expectedMoviesResponse);

        final container = containerHelper.createContainer(
          overrides: [
            moviesRepositoryProvider.overrideWithValue(mockMoviesRepository),
          ],
        );

        final provider = getMoviesProvider(queryData: queryData);

        // Create a listener to simulate watching the provider
        final listener = container.listen(provider, (previous, next) {});

        // Read the provider to initialize it
        await container.read(provider.future);

        // Check that provider is alive
        expect(container.exists(provider), isTrue);

        // Stop listening to trigger onCancel
        listener.close();

        // Wait for cache duration + 1 second to ensure auto-dispose triggers
        await Future.delayed(
          AppDuration.providerCacheDuration + Duration(seconds: 1),
        );

        // Provider should be disposed after timeout
        expect(container.exists(provider), isFalse);
      },
      timeout: Timeout(AppDuration.providerCacheDurationTimeout),
    );

    test(
      '''
    Given a provider that starts the auto-dispose timer
    When it's accessed again before 10 seconds
    Then the timer should be cancelled and provider should remain active
    ''',
      () async {
        final query = MoviesData.inceptionMovieJson()['Title'].toString();
        final queryData = (query: query, page: 1);
        final expectedMoviesResponse = OMDBMoviesResponse.fromJson(
          MoviesData.moviesListJson(),
        );

        when(
          () => mockMoviesRepository.getMovies(
            queryData: queryData,
            cancelToken: any(named: 'cancelToken'),
          ),
        ).thenAnswer((_) async => expectedMoviesResponse);

        final container = containerHelper.createContainer(
          overrides: [
            moviesRepositoryProvider.overrideWithValue(mockMoviesRepository),
          ],
        );

        final provider = getMoviesProvider(queryData: queryData);

        // First read to initialize
        await container.read(provider.future);

        // Simulate onCancel (starts 10-second timer)
        container.invalidate(provider);

        // Wait 1 second (less than the timer duration)
        await Future.delayed(const Duration(seconds: 1));

        // Resume by reading again (should cancel the 10-second timer)
        await container.read(provider.future);

        // Wait 2 more seconds (would exceed original timer if it wasn't cancelled)
        await Future.delayed(const Duration(seconds: 2));

        // Provider should still exist because timer was cancelled on resume
        expect(container.exists(provider), isTrue);
      },
      timeout: Timeout(AppDuration.providerCacheDurationTimeout),
    );

    test(
      '''
    Given a provider with an active auto-dispose timer
    When the provider is resumed (listened to again)
    Then the timer should be cancelled and provider should remain active
    ''',
      () async {
        final query = MoviesData.inceptionMovieJson()['Title'].toString();
        final queryData = (query: query, page: 1);
        final expectedMoviesResponse = OMDBMoviesResponse.fromJson(
          MoviesData.moviesListJson(),
        );

        when(
          () => mockMoviesRepository.getMovies(
            queryData: queryData,
            cancelToken: any(named: 'cancelToken'),
          ),
        ).thenAnswer((_) async => expectedMoviesResponse);

        final container = containerHelper.createContainer(
          overrides: [
            moviesRepositoryProvider.overrideWithValue(mockMoviesRepository),
          ],
        );

        final provider = getMoviesProvider(queryData: queryData);

        // Create initial listener and read provider
        final listener1 = container.listen(provider, (previous, next) {});
        await container.read(provider.future);

        // Verify provider exists
        expect(container.exists(provider), isTrue);

        // Close listener to trigger onCancel (starts timer)
        listener1.close();

        // Wait a bit to ensure onCancel has been called and timer started
        await Future.delayed(const Duration(milliseconds: 100));

        // Create new listener to trigger onResume (should cancel timer)
        final listener2 = container.listen(provider, (previous, next) {});

        // Wait longer than the original timer would have been
        await Future.delayed(const Duration(seconds: 3));

        // Provider should still exist because timer was cancelled on resume
        expect(container.exists(provider), isTrue);

        // Clean up
        listener2.close();
      },
      timeout: Timeout(AppDuration.providerCacheDurationTimeout),
    );
  });

  group('getMovie()', () {
    setUp(() {
      mockDioClient = MockDioClient();
      moviesAPI = MoviesAPI('apiKey');
      moviesRepository = OMDBMoviesRepository(
        client: mockDioClient,
        api: moviesAPI,
      );
    });
    test(
      '''
      Given a valid movieId
      When the API returns a valid movie response
      Then it should return an OMDBMovie successfully
      ''',
      () async {
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

  group('getMovie() provider', () {
    setUp(() {
      containerHelper = ContainerHelper();
      mockMoviesRepository = MockOMDBMoviesRepository();
    });

    test(
      '''
    Given the same movieId called multiple times
    When the provider is accessed
    Then it should return cached result without calling repository again
    ''',
      () async {
        final movieId = ironManMovieJson['imdbID'].toString();
        final expectedMovie = OMDBMovie.fromJson(ironManMovieJson);

        when(
          () => mockMoviesRepository.getMovie(
            movieId: movieId,
            plotType: plotTypeShort,
            cancelToken: any(named: 'cancelToken'),
          ),
        ).thenAnswer((_) async => expectedMovie);

        final container = containerHelper.createContainer(
          overrides: [
            moviesRepositoryProvider.overrideWithValue(mockMoviesRepository),
          ],
        );

        final movie1 = await container.read(
          getMovieProvider(movieId: movieId, plotType: plotTypeShort).future,
        );

        final movie2 = await container.read(
          getMovieProvider(movieId: movieId, plotType: plotTypeShort).future,
        );

        expect(movie1, expectedMovie);
        expect(movie2, expectedMovie);

        verify(
          () => mockMoviesRepository.getMovie(
            movieId: movieId,
            plotType: plotTypeShort,
            cancelToken: any(named: 'cancelToken'),
          ),
        ).called(1);
      },
    );

    test(
      '''
    Given a provider that's no longer being watched
    When 10 seconds pass
    Then the provider should dispose itself
    ''',
      () async {
        final movieId = ironManMovieJson['imdbID'].toString();
        final expectedMovie = OMDBMovie.fromJson(ironManMovieJson);

        when(
          () => mockMoviesRepository.getMovie(
            movieId: movieId,
            plotType: plotTypeShort,
            cancelToken: any(named: 'cancelToken'),
          ),
        ).thenAnswer((_) async => expectedMovie);

        final container = containerHelper.createContainer(
          overrides: [
            moviesRepositoryProvider.overrideWithValue(mockMoviesRepository),
          ],
        );

        final provider = getMovieProvider(
          movieId: movieId,
          plotType: plotTypeShort,
        );

        final listener = container.listen(provider, (previous, next) {});

        await container.read(provider.future);

        expect(container.exists(provider), isTrue);

        listener.close();

        await Future.delayed(
          AppDuration.providerCacheDuration + Duration(seconds: 1),
        );

        expect(container.exists(provider), isFalse);
      },
      timeout: Timeout(AppDuration.providerCacheDurationTimeout),
    );

    test(
      '''
      Given a provider that starts the auto-dispose timer
      When it's accessed again before 10 seconds
      Then the timer should be cancelled and provider should remain active
      ''',
      () async {
        final movieId = ironManMovieJson['imdbID'].toString();
        final expectedMovie = OMDBMovie.fromJson(ironManMovieJson);

        when(
          () => mockMoviesRepository.getMovie(
            movieId: movieId,
            plotType: plotTypeShort,
            cancelToken: any(named: 'cancelToken'),
          ),
        ).thenAnswer((_) async => expectedMovie);

        final container = containerHelper.createContainer(
          overrides: [
            moviesRepositoryProvider.overrideWithValue(mockMoviesRepository),
          ],
        );

        final provider = getMovieProvider(
          movieId: movieId,
          plotType: plotTypeShort,
        );

        await container.read(provider.future);

        container.invalidate(provider);

        await Future.delayed(const Duration(seconds: 1));

        await container.read(provider.future);

        await Future.delayed(const Duration(seconds: 2));

        expect(container.exists(provider), isTrue);
      },
      timeout: Timeout(AppDuration.providerCacheDurationTimeout),
    );

    test(
      '''
      Given a provider with an active auto-dispose timer
      When the provider is resumed (listened to again)
      Then the timer should be cancelled and provider should remain active
      ''',
      () async {
        final movieId = ironManMovieJson['imdbID'].toString();
        final expectedMovie = OMDBMovie.fromJson(ironManMovieJson);

        when(
          () => mockMoviesRepository.getMovie(
            movieId: movieId,
            plotType: plotTypeShort,
            cancelToken: any(named: 'cancelToken'),
          ),
        ).thenAnswer((_) async => expectedMovie);

        final container = containerHelper.createContainer(
          overrides: [
            moviesRepositoryProvider.overrideWithValue(mockMoviesRepository),
          ],
        );

        final provider = getMovieProvider(
          movieId: movieId,
          plotType: plotTypeShort,
        );

        final listener1 = container.listen(provider, (previous, next) {});
        await container.read(provider.future);

        expect(container.exists(provider), isTrue);

        listener1.close();

        await Future.delayed(const Duration(milliseconds: 100));

        final listener2 = container.listen(provider, (previous, next) {});

        await Future.delayed(const Duration(seconds: 3));

        expect(container.exists(provider), isTrue);

        listener2.close();
      },
      timeout: Timeout(Duration(seconds: 45)),
    );
  });
}
